require 'typhoeus'
require 'json'

module Checkmate
  class Client
    include Typhoeus

    @@base_uri = "https://partners-staging.checkmate.io"
    attr_writer :private_key

    def initialize(private_key)
      self.private_key = private_key
    end

    def get_property(property_params)
      response = Request.new(
        properties_uri,
        method: :get,
        params: uri_params(property_params),
        headers: headers,
        followlocation: true).run

      handle_response_and_maybe_return_json(response)
    end

    def headers
      headers = {
        "Accept" => "application/json",
        "X-CheckMate-API-Token" => @private_key
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

    def properties_uri
      @@base_uri + "/properties"
    end

    def uri_params(property_params)
      uri_params = {
        "property[name]" => property_params[:name],
        "property[phone]" => property_params[:phone],
        "property[address][street]" => property_params[:street],
        "property[address][city]" => property_params[:city],
        "property[address][region]" => property_params[:region],
        "property[address][postal_code]" => property_params[:postal_code]}
    end
  end
end
