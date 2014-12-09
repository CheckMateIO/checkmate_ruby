require_relative '../spec_helper'

describe Checkmate::UpdateReservationParams do
  let(:reservation) {Checkmate::UpdateReservationParams.new(1234, {:first_name => "Bob"})}

  it "returns reservations uri path with reservation id" do
    expect(reservation.uri_path).to eq("/reservations/1234")
  end

  it "sets updated params on request" do
    uri_params = CGI::parse(reservation.to_uri_params)
    expect(uri_params["reservation[first_name]"]).to eq(["Bob"])
  end
end
