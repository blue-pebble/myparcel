module Myparcel
  module API
    # Base class for all endpoints
    class Base
      attr_accessor :path
      attr_reader :authentication

      def initialize(authentication)
        @authentication = authentication
      end

      protected

      # rubocop:disable MethodLength
      def request(method, path, options = {})
        url = [authentication.host, path].join '/'
        httparty_options = {
          query: options.fetch(:query, {}),
          body: options.fetch(:body, ''),
          headers: authentication.headers.update(options[:headers] || {})
        }
        response = HTTParty.send method, url, httparty_options

        case response.code
        when 200..299
          response
        when 422
          raise UnprocessableEntity.parse(response.body, "Unprocessable entity for `#{method} #{url}` with #{httparty_options}")
        else
          raise "Request failed with status #{response.code}: #{response.body}"
        end
      end
      # rubocop:enable MethodLength

      def headers_for_shipment(type)
        case type
        when :standard then 'application/vnd.shipment+json; charset=utf-8'
        when :return then 'application/vnd.return_shipment+json; charset=utf-8'
        when :unrelated then 'application/vnd.unrelated_return_shipment+json; charset=utf-8'
        else 'application/vnd.shipment+json; charset=utf-8'
        end
      end
    end

    class MyparcelError < RuntimeError
      def format
        raise "Cannot format abstract error"
      end
    end

    private

    class UnprocessableEntity < MyparcelError
      attr_reader :info, :message, :errors

      def initialize(info, message, errors)
        @info = info
        @message = message
        @errors = errors
      end

      def self.parse(data, info=nil)
        payload = JSON.parse(data)
        message = payload.fetch("message", "Unknown error")
        errors = payload.fetch("errors", []).flat_map {|x| x.fetch("human", [])}
        UnprocessableEntity.new(info, message, errors)
      rescue => e
        UnprocessableEntity.new(info, "Failed to parse response payload: #{e.class.name}", [e.message])
      end

      def format
        if @errors.empty?
          lines = [@info, @message]
        else
          lines = [@info, @message, *errors.map {|x| "- #{x}"}]
        end
        lines.compact.join("\n")
      end
    end
  end
end
