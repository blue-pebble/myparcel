require 'active_interaction'
require 'httparty'
require 'virtus'
require 'base64'
require 'pry'

require 'myparcel/version'

require 'myparcel/authentication'
require 'myparcel/client'

require 'myparcel/shipment'

require 'myparcel/api/base'
require 'myparcel/api/shipments'

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
    # client.shipments.all
    # ```
    def client(api_key = nil)
      @client ||= Myparcel::Client.new(api_key)
    end
  end
end
