module Checkmate
  class UpdateReservationParams
    attr_accessor :reservation_id, :reservation_params

    def initialize(reservation_id, reservation_params)
      self.reservation_id = reservation_id
      self.reservation_params = reservation_params
    end

    def to_uri_params
      Checkmate::QueryParamUtils.encode({:reservation => reservation_params})
    end

    def uri_path
      "/reservations/#{reservation_id}"
    end
  end
end
