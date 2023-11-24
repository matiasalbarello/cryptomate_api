# frozen_string_literal: true

module CryptomateApi
  module Management
    # Get all the blockchains available in the platform. You can use this information to create new
    # credentials for your clients or using every other endpoints that ask for the blockchain where
    # you want to operate.
    class Blockchain < CryptomateApi::Base
      # Get all blockchains
      # https://cryptomate.me/docs/management#get-all-blockchains
      # Response:
      # [
      #   {
      #     "id": "string",
      #     "description": "string"
      #   }
      # ]
      def get_all_blockchains
        self.class.get("/management/blockchains/list")
      end
    end
  end
end
