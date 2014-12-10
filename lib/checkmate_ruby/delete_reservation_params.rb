module Checkmate
  class DeleteReservationParams
    attr_accessor :reservation_id

    def initialize(reservation_id)
      self.reservation_id = reservation_id
    end

    def to_uri_params
      {}
    end

    def uri_path
      "/reservations/#{reservation_id}"
    end

    def to_json; end
  end
end
