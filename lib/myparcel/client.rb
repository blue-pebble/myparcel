module Myparcel
  # Represents a client for the API
  class Client
    attr_accessor :authentication, :config

    def initialize(api_key = nil, config={})
      @authentication = Myparcel::Authentication.new(api_key)
      @config = config
      raise 'No credentials provided' if @authentication.invalid?
    end

    # Get delivery options for an address
    #
    # == Usage:
    #
    # ```ruby
    # client.delivery_options.find({...})
    # ```
    def delivery_options
      @delivery_options ||= Myparcel::API::DeliveryOptions.new(authentication, config)
    end

    # Shipments management endpoint
    #
    # == Usage:
    #
    # Create shipments:
    #
    # ```ruby
    # client = Myparcel.client('api_key')
    # client.shipments.create(shipments: [{...}])
    # ```
    #
    # Find shipments:
    #
    # ```ruby
    # # returns all available shipments:
    # client.shipments.find
    #
    # # returns shipments by id
    # client.shipments.find(shipment_ids: [1, 2])
    # ```
    def shipments
      @shipments ||= Myparcel::API::Shipments.new(authentication, config)
    end

    def shipment_labels
      @shipment_labels ||= Myparcel::API::ShipmentLabels.new(authentication, config)
    end

    def tracktraces
      @tracktraces ||= Myparcel::API::Tracktraces.new(authentication, config)
    end

    def webhooks
      @webhooks ||= Myparcel::API::WebhookSubscriptions.new(authentication, config)
    end
  end
end
