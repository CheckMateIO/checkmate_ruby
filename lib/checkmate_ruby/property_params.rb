require 'checkmate_ruby/query_param_utils'

module Checkmate
  class PropertyParams
    attr_accessor :property_params
    
    def initialize(property_params)
      self.property_params = property_params
    end

    def to_uri_params
      QueryParamUtils.encode({:property => property_params}) 
    end

    def uri_path
      "/properties"
    end

    def to_json; end
  end
end
