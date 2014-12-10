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
      uri_params["confirmation_number"] = confirmation_number
      uri_params["exclude_properties"] = exclude_properties
      QueryParamUtils.encode(uri_params)
    end

    def uri_path
      if property_id
        "/properties/#{property_id}/reservations"
      elsif reservation_id
        "/reservations/#{reservation_id}"
      else
        "/reservations"
      end
    end
    
    def to_json; end
  end
end
