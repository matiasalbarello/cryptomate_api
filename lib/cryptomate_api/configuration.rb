# frozen_string_literal: true

module CryptomateApi
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :base_uri

    def initialize
      @api_key = nil
      @base_uri = 'https://cryptomate.me/api'
    end
  end
end
