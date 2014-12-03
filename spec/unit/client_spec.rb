require_relative '../spec_helper'

describe Checkmate::Client do
  @private_key = "private_key"
  let(:client) {Checkmate::Client.new({:private_key => @private_key})}
	let(:property) {instance_double("Checkmate::Property",
		:uri_path => "/properties")}

  it "must include typhoeus methods" do
    expect(Checkmate::Client).to include Typhoeus
  end

  it "has the specific resource path" do
    expected_uri = "https://partners-staging.checkmate.io/properties"
    expect(client.specific_uri(property)).to eq(expected_uri)
  end

  it "has the private key set" do
    expect(client.headers["X-CheckMate-API-Token"]).to eq(@private_key)
  end

  it "has media types set" do
    expect(client.headers["Accept"]).to eq("application/json")
  end
end
