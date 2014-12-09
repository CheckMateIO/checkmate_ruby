require_relative '../spec_helper'
require 'cgi'

describe Checkmate::ReservationsParams do
  let(:res_params_with_property_id) {Checkmate::ReservationsParams.new({:property_id => "1234", :confirmation_number => "123"})}

  let(:res_params_with_reservation_id) {Checkmate::ReservationsParams.new({:reservation_id => "1234", :confirmation_number => "123"})}
  
  let(:res_params_no_id) {Checkmate::ReservationsParams.new}
  let(:res_params_no_id_exclude_properties) {Checkmate::ReservationsParams.new({:exclude_properties => true})}

  it "returns correct path for property id" do 
    expect(res_params_with_property_id.uri_path).to eq("/properties/1234/reservations")
  end

  it "returns correct path for reservation id" do
    expect(res_params_with_reservation_id.uri_path).to eq("/reservations/1234")
  end

  it "returns correct path for no ids provided" do
    expect(res_params_no_id.uri_path).to eq("/reservations")
  end

  it "converts to uri params with confirmation number" do
    uri_params = CGI::parse(res_params_with_property_id.to_uri_params)
    expect(uri_params["confirmation_number"]).to eq(["123"])
  end

  it "converts to uri params with exclude properties parameter" do
    uri_params = CGI::parse(res_params_no_id_exclude_properties.to_uri_params)
    expect(uri_params["exclude_properties"]).to eq(["true"])
  end
end
