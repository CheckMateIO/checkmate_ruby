module Checkmate
  class ReservationParams
    attr_accessor :reservation_params

    #required if a property is not being created
    attr_accessor :property_id

    def initialize(reservation_params, property_id)
      self.reservation_params = reservation_params
      self.property_id = property_id
    end

    def to_uri_params
      Checkmate::QueryParamUtils.encode({:reservation => reservation_params})
    end

    def uri_path
      property_id ? "/properties/#{property_id}/reservations" : "/reservations"
    end

    def to_json; end
  end
end
