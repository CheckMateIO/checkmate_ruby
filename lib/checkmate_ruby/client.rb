require 'typhoeus'
require 'json'
require 'checkmate_ruby/property'

module Checkmate
  class Client
    include Typhoeus

    @@base_uri = "https://partners-staging.checkmate.io"
    attr_accessor :private_key

    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def get_property(property_params)
      property = Checkmate::Property.new(property_params)
      request = create_request(property)
      handle_response(request.run)
    end

    private
      def create_request(resource)
        Request.new(
          specific_uri(resource),
          method: :get,
          params: resource.to_uri_params,
          headers: headers,
          followlocation: true)
      end

      def headers
        headers = {
          "Accept" => "application/json",
          "X-CheckMate-API-Token" => private_key
        }
      end

      def handle_response(response)
        if response.success?
          JSON.parse(response.body)
        else
          {:code => response.code,
            :message => response.status_message}
        end
      end

      def specific_uri(resource)
        @@base_uri + resource.uri_path
      end
    end
end
