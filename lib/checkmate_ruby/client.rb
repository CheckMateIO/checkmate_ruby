require 'typhoeus'
require 'json'

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
      property = Property.new(property_params)
      response = Request.new(
        specific_uri(property),
        method: :get,
        params: property.to_uri_params,
        headers: headers,
        followlocation: true).run

      handle_response_and_maybe_return_json(response)
    end

    def headers
      headers = {
        "Accept" => "application/json",
        "X-CheckMate-API-Token" => private_key
      }
    end

    def handle_response_and_maybe_return_json(response)
      if response.success?
        JSON.parse(response.body)
      elsif response.timed_out?
        "timed out!"
      elsif response.code == 0
        response.return_message #something's gone wrong!
      else
        response.code.to_s #
      end
    end

    def specific_uri(resource)
      @@base_uri + resource.uri_path
    end
  end
end
