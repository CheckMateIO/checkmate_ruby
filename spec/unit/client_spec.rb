require_relative '../spec_helper'

describe Checkmate::Client do
  before(:all) do
    @private_key = "private_key"
    @property_params = {:name => "n", :phone => "123",
      :address => {:street => "1625", :city => "San", :region => "CA", :postal_code => "94115"}}
    @reservations_params = {:exclude_properties => true}
    @reservation_id = 123
    @reservation_params = {:last_name => "foo", :property => {:name => "hotel", :full_address => "bar"}}
    @update_reservation_params = {:last_name => "foo"}
  end

  let(:client) {Checkmate::Client.new({:private_key => @private_key})}

  it "must include typhoeus methods" do
    expect(Checkmate::Client).to include Typhoeus
  end

  it "handles a success response for fetching a property" do
    stub_response = Typhoeus::Response.new(code: 200, body: "{\"h\":\"g\"}")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.get_property(@property_params)).to eq({"h" => "g"})
  end

  it "handles a failure response" do
    stub_response = Typhoeus::Response.new(code: 500, status_message: "failure")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.get_property(@property_params)).to eq({:code => 500,
                                                        :message => "failure"})
  end

  it "handles a success response for listing reservations" do
    stub_response = Typhoeus::Response.new(code: 200, body: "{\"h\":\"g\"}")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.list_reservations(@reservations_params)).to eq({"h" => "g"})
  end

  it "handles a success response for showing a reservation" do
    stub_response = Typhoeus::Response.new(code: 200, body: "{\"h\":\"g\"}")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.show_reservation(@reservation_id)).to eq({"h" => "g"})
  end

  it "handles a success response for creating a reservation" do
    stub_response = Typhoeus::Response.new(code: 200, body: "{\"h\":\"g\"}")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.create_reservation(@reservation_params)).to eq({"h" => "g"})
  end

  it "handles a success response for updating a reservation" do
    stub_response = Typhoeus::Response.new(code: 200, body: "{\"h\":\"g\"}")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.update_reservation(@reservation_id, @update_reservation_params)).to eq({"h" => "g"})
  end

  it "handles a success response for deleting a reservation" do
    stub_response = Typhoeus::Response.new(code: 200, body: "{\"h\":\"g\"}")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.delete_reservation(@reservation_id)).to eq({"h" => "g"})
  end

  it "handles a success response for bulk creating reservations" do
    stub_response = Typhoeus::Response.new(code: 200, body: "[{\"h\":\"g\"}, {\"f\":\"e\"}]")
    Typhoeus.stub(/checkmate/).and_return(stub_response)
    expect(client.bulk_create_reservations([@reservation_params])).to eq([{"h" => "g"}, {"f" => "e"}])
  end
end
