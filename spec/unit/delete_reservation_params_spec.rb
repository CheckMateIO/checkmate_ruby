require_relative '../spec_helper'

describe Checkmate::DeleteReservationParams do
  let(:reservation) {Checkmate::DeleteReservationParams.new(1234)}

  it "returns reservations uri path with reservation id" do
    expect(reservation.uri_path).to eq("/reservations/1234")
  end

  it "returns empty query params" do
    expect(reservation.to_uri_params).to eq({})
  end
end
