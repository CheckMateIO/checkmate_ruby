module Checkmate
  class Reservation
    attr_accessor :reservation_params

    #required if a property is not being created
    attr_accessor :property_id

    #else we'll create a property
    attr_accessor :property_params

    def initialize(reservation_params, property_params = {}, property_id = nil)
      self.reservation_params = reservation_params

      if property_id
        self.property_id = property_id
      else
        self.property_params = property_params
      end
    end

    def to_uri_params
      uri_params = {:reservation => reservation_params}

      if !property_id
        uri_params[:reservation] = uri_params[:reservation] \
            .merge({:property => property_params})
      end
      Checkmate::QueryParamUtils.encode(uri_params)
    end

    def uri_path
      property_id ? "/properties/#{property_id}/reservations" : "/reservations"
    end
  end
end
