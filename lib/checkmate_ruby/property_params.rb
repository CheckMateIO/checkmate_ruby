require 'checkmate_ruby/param_utils'

module Checkmate
  class PropertyParams
    attr_accessor :property_params
    
    def initialize(property_params)
      self.property_params = property_params
    end

    def to_uri_params
      ParamUtils.encode({:property => property_params}) 
    end

    def uri_path
      "/properties"
    end
  end
end
