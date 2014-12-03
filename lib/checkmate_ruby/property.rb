module Checkmate
	class Property
		attr_accessor :name, :phone, :street, :city, :region, :postal_code
		
		def initialize(property_params)
			name = property_params[:name]
			phone = property_params[:phone]
			street = property_params[:street]
			city = property_params[:city]
			region = property_params[:region]
			postal_code = property_params[:postal_code]
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
