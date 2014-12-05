require_relative '../spec_helper'
require 'uri'

describe Checkmate::PropertyParams do
  let(:property_params) {Checkmate::PropertyParams.new({:name => "n%&", :phone => "123",
      :address => {:street => "1625", :city => "San Fr", :region => "CA", :postal_code => "94115"}})}

  it "returns correct path" do 
    expect(property_params.uri_path).to eq("/properties")
  end

  it "converts to uri params" do
    uri_params = CGI::parse(property_params.to_uri_params)
    expect(uri_params["property[name]"]).to eq(["n%&"])
    expect(uri_params["property[phone]"]).to eq(["123"])
    expect(uri_params["property[address][street]"]).to eq(["1625"])
    expect(uri_params["property[address][city]"]).to eq(["San Fr"])
    expect(uri_params["property[address][region]"]).to eq(["CA"])
    expect(uri_params["property[address][postal_code]"]).to eq(["94115"])
  end
end
