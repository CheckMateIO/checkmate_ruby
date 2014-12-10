require_relative '../spec_helper'

describe Checkmate::BulkReservationParams do
  before(:all) do
    @reservation1 = {:external_id => "123", :last_name => "smith"}
    @reservation2 = {:external_id => "456", :last_name => "brown"}
    @reservation3 = {:external_id => "789", :last_name => "hatter"}
  end

  let(:bulk) {Checkmate::BulkReservationParams.new([@reservation1, @reservation2, @reservation3], nil)}
  let(:bulk_webhook) {Checkmate::BulkReservationParams.new([@reservation1, @reservation2, @reservation3], "https")}

  it "returns the bulk path" do
    expect(bulk.uri_path).to eq("/reservations/bulk_create")
  end

  it "encodes the reservations in the params" do
    uri_params = CGI::parse(bulk.to_uri_params)
    expect(uri_params["reservations[][external_id]"]).to eq(["123", "456", "789"])
    expect(uri_params["reservations[][last_name]"]).to eq(["smith", "brown", "hatter"])
  end 

  it "puts the webhook into the uri parameters" do
    uri_params = CGI::parse(bulk_webhook.to_uri_params)
    expect(uri_params["webhook"]).to eq(["https"])
  end
end
