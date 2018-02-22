require 'httparty'
require 'virtus'
require 'base64'

require 'myparcel/version'

require 'myparcel/authentication'
require 'myparcel/client'

require 'myparcel/api/base'
require 'myparcel/api/delivery_options'
require 'myparcel/api/shipments'
require 'myparcel/api/tracktraces'
require 'myparcel/api/webhook_subscriptions'

# Ruby API Wrapper for https://api.myparcel.nl
module Myparcel
  class << self
    # == Usage:
    #
    # === Initialize client
    #
    # With `ENV['MYPARCEL_API_KEY']`:
    #
    # ```ruby
    # client = Myparcel.client
    # ```
    #
    # with parameter:
    #
    # ```ruby
    # client = Myparcel.client('your-api-key')
    # ```
    #
    # === Get Shipments
    #
    # ```ruby
    # client = Myparcel.client('your-api-key')
    # client.shipments.find
    # ```
    def client(api_key = nil)
      @client ||= Myparcel::Client.new(api_key)
    end
  end
end
