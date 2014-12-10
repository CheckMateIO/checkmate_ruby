module Checkmate
  class BulkReservationParams
    attr_accessor :reservations, :webhook

    def initialize(reservations, webhook)
      self.reservations = reservations
      self.webhook = webhook
    end

    def to_uri_params
      Checkmate::QueryParamUtils.encode({:reservations => reservations, :webhook => webhook})
    end

    def uri_path
      "/reservations/bulk_create"
    end
  end
end
