# frozen_string_literal: true

require_relative 'cryptomate_api/base'
require_relative 'cryptomate_api/payment'

Dir[File.join(__dir__, 'cryptomate_api/{management,mpc}/**/*.rb')].each { |file| require file }

module CryptomateApi
  class Error < StandardError; end
end
