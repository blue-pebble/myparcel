module Myparcel
  module API
    # Class for getting delivery options
    class WebhookSubscriptions < Myparcel::API::Base
      def find(options = {})
        subscription_ids = options.fetch(:subscription_ids, [])
        raise ArgumentError, 'options[:subscription_ids] cannot be empty' if subscription_ids.empty?
        subscription_ids = subscription_ids.join(';')
        full_path = [path, subscription_ids].join('/')
        response = request :get, full_path
        response['data']['webhook_subscriptions']
      end

      def create(options = {})
        subscriptions = options.fetch(:subscriptions, [])
        options[:body] = JSON.generate(data: { webhook_subscriptions: subscriptions })
        options[:headers] ||= {}
        options[:headers]['Content-Type'] = 'application/json; charset=utf-8'
        response = request :post, path, options
        response['data']['ids']
      end

      def delete(options = {})
        subscription_ids = options.fetch(:subscription_ids, [])
        raise ArgumentError, "options[:subscription_ids] must not be empty" if subscription_ids.empty?
        request :delete, "#{path}/#{subscription_ids.join(';')}"
        nil
      end

      def path
        'webhook_subscriptions'
      end
    end
  end
end
