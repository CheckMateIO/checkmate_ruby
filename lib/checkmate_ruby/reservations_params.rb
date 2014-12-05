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
      uri_params["confirmation_number"] = confirmation_number \
          unless confirmation_number.nil?
      uri_params["exclude_properties"] = exclude_properties \
          unless exclude_properties.nil?
      QueryParamUtils.encode(uri_params)
    end

    def uri_path
      if property_id.nil?
        if reservation_id.nil?
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
