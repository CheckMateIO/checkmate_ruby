require 'checkmate_ruby/query_param_utils'

module Checkmate
  class ReservationsParams
    attr_accessor :property_id, :confirmation_number, :exclude_properties, :reservation_id
    
    def initialize(reservation_params = {})
      reservation_params.each do |key, value|
        public_send("#{key}=", value)
      end
    end

    def to_uri_params
      uri_params = {}
      uri_params["confirmation_number"] = confirmation_number if confirmation_number
      uri_params["exclude_properties"] = exclude_properties if exclude_properties
      QueryParamUtils.encode(uri_params)
    end

    def uri_path
      if property_id
        if reservation_id
          "/reservations"
        else
          "/reservations/#{reservation_id}"
        end
      else
        "/properties/#{property_id}/reservations"
      end
    end
  end
end
