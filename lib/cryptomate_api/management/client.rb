# frozen_string_literal: true

module CryptomateApi
  module Management
    # Manage the company information from here, like changing the webhook url where we will
    # notify that some event happened or just changing the name of the company.
    class Client < CryptomateApi::Base
      # Get clients information
      # https://cryptomate.me/docs/management#get-clients-information
      # Response:
      # {
      #   "name": "string",
      #   "last_name": "string",
      #   "email": "string",
      #   "social_reason": "string",
      #   "webhook_url": "string",
      # }
      def get_clients
        self.class.get("/management/clients")
      end

      # Update Webhook-Url
      # https://cryptomate.me/docs/management#update-webhook-url
      # @param [String] webhook_url (New webhook url to use to inform any changes.)
      # Response:
      # {
      #   "name": "string",
      #   "email": "string",
      #   "webhook_url": "string"
      # }
      def update_webhook_url(webhook_url)
        self.class.patch("/management/clients/webhook-url", body: { webhook_url: }.to_json)
      end

      # Update Client-Information
      # https://cryptomate.me/docs/management#update-client-information
      # @param [String] name (Name of the client to update.)
      # @param [String] email (Email of the client to update.)
      # @param [String] webhook_url (New webhook url to use to inform any changes.)
      # Response:
      # {
      #   "name": "string",
      #   "email": "string",
      #   "webhook_url": "string"
      # }
      def update_client_information(name, email, webhook_url)
        self.class.put("/management/clients", body: { name:, email:, webhook_url: }.to_json)
      end

      # Update Payment Address
      # https://cryptomate.me/docs/management#update-payments-address
      # @param [String] address (Address where you want to receive the payments)
      # @param [String] blockchain (Blockchain where you want to receive the payments)
      # Response:
      # {
      #   "address": "string",
      # }
      def update_payment_address(address, blockchain)
        self.class.patch("/management/clients/payment-treasury", body: { address:, blockchain: }.to_json)
      end
    end
  end
end
