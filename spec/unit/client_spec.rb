require_relative '../spec_helper'

describe Checkmate::Client do
	@private_key = "private_key"
	let(:client) {Checkmate::Client.new(@private_key)}

	describe "default attributes" do
		it "must include typhoeus methods" do
			expect(Checkmate::Client).to include Typhoeus
		end

		it "has the properties path" do
			expected_uri = "https://partners-staging.checkmate.io/properties"
			expect(client.properties_uri).to eq(expected_uri)
		end

		it "has the private key set" do
			expect(client.headers["X-CheckMate-API-Token"]).to eq(@private_key)
		end
		it "has media types set" do
			expect(client.headers["Accept"]).to eq("application/json")
		end
	end

	describe "property parameters translated to uri parameters" do
		it "sets all the parameters" do
			property_params = {:name => "Hotel Kabuki",
				:phone => "14123456789",
				:street => "1625 Post St",
				:city => "San Francisco",
				:region => "CA",
				:postal_code => "94115"}

				uri_params = client.uri_params(property_params)
				expect(uri_params["property[name]"]).to eq(property_params[:name])
				expect(uri_params["property[phone]"]).to eq(property_params[:phone])
				expect(uri_params["property[address][street]"]).to eq(property_params[:street])
				expect(uri_params["property[address][city]"]).to eq(property_params[:city])
				expect(uri_params["property[address][region]"]).to eq(property_params[:region])
				expect(uri_params["property[address][postal_code]"]).to eq(property_params[:postal_code])
		end
	end
end
