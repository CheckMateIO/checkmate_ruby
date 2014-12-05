require 'queryparams'

module Checkmate
  class PropertyParams
    attr_accessor :property_params
    
    def initialize(property_params)
      self.property_params = property_params
    end

    def to_uri_params
      QueryParams.encode({:property => property_params}) 
    end

    def uri_path
      "/properties"
    end
  end
end
