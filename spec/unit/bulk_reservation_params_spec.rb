require_relative '../spec_helper'

describe Checkmate::BulkReservationParams do
  before(:all) do
    @reservation1 = {:external_id => "123", :last_name => "smith"}
    @reservation2 = {:external_id => "456", :last_name => "brown"}
    @reservation3 = {:external_id => "789", :last_name => "hatter"}
  end

  let(:bulk) {Checkmate::BulkReservationParams.new([@reservation1, @reservation2, @reservation3], nil)}

  it "returns the bulk path" do
    expect(bulk.uri_path).to eq("/reservations/bulk_create")
  end

  it "encodes the reservations in the body" do
    json = JSON.parse(bulk.to_json)["reservations"]
    expect(json[0]["external_id"]).to eq("123")
    expect(json[1]["external_id"]).to eq("456")
    expect(json[2]["external_id"]).to eq("789")
  end 
end
