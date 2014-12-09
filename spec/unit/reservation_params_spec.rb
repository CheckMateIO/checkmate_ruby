require_relative '../spec_helper'

describe Checkmate::ReservationParams do
  let(:reservation_with_property_id) {Checkmate::ReservationParams.new({:last_name => "n"}, {}, 1234)}

  let(:reservation_with_property_params_fa) {Checkmate::ReservationParams.new({:last_name => "n"}, {:name => "hotel", :full_address => "freeform"})}

  let(:reservation_with_property_params_sa) {Checkmate::ReservationParams.new({:last_name => "n"}, {:name => "hotel", :address => {:street => "bah"}})}

  it "uses a property id if provided" do
    expect(reservation_with_property_id.uri_path).to eq("/properties/1234/reservations")
  end

  it "returns reservations uri path with no property id" do
    expect(reservation_with_property_params_fa.uri_path).to eq("/reservations")
  end

  it "sets full_address if provided" do
    uri_params = CGI::parse(reservation_with_property_params_fa.to_uri_params)

    expect(uri_params["reservation[last_name]"]).to eq(["n"])
    expect(uri_params["reservation[property][name]"]).to eq(["hotel"])
    expect(uri_params["reservation[property][full_address]"]).to eq(["freeform"])
  end

  it "sets structured address if provided" do
    uri_params = CGI::parse(reservation_with_property_params_sa.to_uri_params)
    expect(uri_params["reservation[last_name]"]).to eq(["n"])
    expect(uri_params["reservation[property][name]"]).to eq(["hotel"])
    expect(uri_params["reservation[property][address][street]"]).to eq(["bah"])
  end
end
