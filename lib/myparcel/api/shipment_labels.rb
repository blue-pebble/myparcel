module Myparcel
  module API
    class ShipmentLabels < Myparcel::API::Base
      def get_pdf(options = {})
        shipment_ids = options.fetch(:shipment_ids).join(";")
        response = request :get, ['shipment_labels', shipment_ids], {}
        response.body
      end
    end
  end
end
