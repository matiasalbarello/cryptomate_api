require 'httparty'

module CryptomateApi
  class Base
    include HTTParty

    # Initializes the client with the given API key
    def initialize
      CryptomateApi.configuration ||= CryptomateApi::Configuration.new
      @api_key = CryptomateApi.configuration.api_key
      self.class.base_uri CryptomateApi.configuration.base_uri
      self.class.headers "x-api-key" => "#{@api_key}"
    end
  end
end