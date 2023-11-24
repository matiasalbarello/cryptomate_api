# frozen_string_literal: true

module CryptomateAPI
  module Management
    # Manage the company configurations from here, like changing the payment destination address for each blockchain.
    class Configuration < CryptomateAPI::Base
      # Get payment destination
      # Gets the treasury wallet address for holding the payments received on the selected blockchain.
      # https://cryptomate.me/docs/management#get-payment-destination
      # @param [String] blockchain (Id of the blockchain.)
      # Response:
      # {
      #   "address": "string",
      #   "blockchain": "string"
      # }
      def get_payment_destination(blockchain)
        self.class.get("/management/configurations/payments/#{blockchain}")
      end

      # Set payment destination
      # Sets the treasury wallet that all the payments will sent after being completed.
      # https://cryptomate.me/docs/management#set-payment-destination
      # @param [String] address (Address of the treasury wallet)
      # @param [String] blockchain (Id of the blockchain.)
      # Response: None
      def set_payment_destination(address, blockchain)
        self.class.post("/management/configurations/payments", body: { address:, blockchain: }.to_json)
      end

      # Delete payment destination
      # Deletes the treasury wallet that all the payments will sent after being completed.
      # https://cryptomate.me/docs/management#delete-payment-destination
      # @param [String] blockchain (Id of the blockchain.)
      # Response: None
      def delete_payment_destination(blockchain)
        self.class.delete("/management/configurations/payments/#{blockchain}")
      end
    end
  end
end
