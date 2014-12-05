require_relative '../spec_helper'
require 'uri'

describe Checkmate::PropertyParams do
  let(:property) {Checkmate::PropertyParams.new({:name => "n%&", :phone => "123",
      :address => {:street => "1625", :city => "San Fr", :region => "CA", :postal_code => "94115"}})}

  it "returns correct path" do 
    expect(property.uri_path).to eq("/properties")
  end

  it "converts to uri params" do
    uri_params = property.to_uri_params
    # it didn't blow up!
  end
end
