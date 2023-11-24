require 'httparty'

module CryptomateApi
  class Base
    include HTTParty
    base_uri 'https://cryptomate.me/api'

    # Initializes the client with the given API key
    def initialize(api_key)
      @api_key = api_key
      self.class.headers "Authorization" => "Bearer #{api_key}"
    end
  end
end