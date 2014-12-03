module Checkmate
  class Property
    attr_accessor :name, :phone, :street, :city, :region, :postal_code
    
    def initialize(property_params)
      property_params.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def to_uri_params
      uri_params = {
        "property[name]" => name,
        "property[phone]" => phone,
        "property[address][street]" => street,
        "property[address][city]" => city,
        "property[address][region]" => region,
        "property[address][postal_code]" => postal_code}
    end

    def uri_path
      "/properties"
    end
  end
end
