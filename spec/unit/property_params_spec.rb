require_relative '../spec_helper'

describe Checkmate::PropertyParams do
  let(:property) {Checkmate::PropertyParams.new({:name => "n", :phone => "123",
      :street => "1625", :city => "San", :region => "CA", :postal_code => "94115"})}

  it "returns correct path" do 
    expect(property.uri_path).to eq("/properties")
  end

  it "converts to uri params" do
    uri_params = property.to_uri_params
    expect(uri_params["property[name]"]).to eq(property.name)
    expect(uri_params["property[phone]"]).to eq(property.phone)
    expect(uri_params["property[address][street]"]).to eq(property.street)
    expect(uri_params["property[address][city]"]).to eq(property.city)
    expect(uri_params["property[address][region]"]).to eq(property.region)
    expect(uri_params["property[address][postal_code]"]).to eq(property.postal_code)
  end
end
