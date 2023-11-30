# frozen_string_literal: true

require_relative 'cryptomate_api/configuration'
require_relative 'cryptomate_api/base'

Dir[File.join(__dir__, 'cryptomate_api/{management,mpc,nft}/**/*.rb')].sort.each { |file| require file }

module CryptomateApi
  class Error < StandardError; end
end
