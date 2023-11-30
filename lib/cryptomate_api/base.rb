# frozen_string_literal: true

require 'httparty'

module CryptomateApi
  class << self
    def configure
      yield self if block_given?
    end

    def base_uri=(uri)
      Base.base_uri uri
    end

    def api_key=(key)
      Base.headers 'Content-Type' => 'application/json', 'x-api-key' => key
    end
  end

  class Base
    include HTTParty

    class << self
      [:get, :post, :put, :patch, :delete, :head, :options, :move].each do |http_method|
        define_method(http_method) do |*args, &block|
          ensure_configuration!
          super(*args, &block)
        end
      end

      private

      def ensure_configuration!
        errors = []
        errors << "Base URI not configured" if base_uri.nil?
        errors << "API key not configured" if headers['x-api-key'].nil?

        raise CryptomateApi::Error, errors.join(", ") unless errors.empty?
      end
    end
  end
end
