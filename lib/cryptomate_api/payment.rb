# frozen_string_literal: true

module CryptomateApi
  # The Payments tool is designed to create payments in specific assets through a secure escrow wallet system.
  # To use this module, you will first need to set up your `payment_address` on the Management API. This address is where you want to receive your funds once the payment is complete.

  # Once you have set up your `payment_address`, you can use the Payments API to create payments in the following steps:

  # 1. Create a payment intent: is a representation of a payment that is being processed. To create a payment intent, you will need to specify the following information:
  #   a. The amount of the payment
  #   b. The address of the asset in which the payment is to be made (Check listed token API from this section)
  #   c. The blockchain where your assets exists (Check get blockchain from the Management API)
  # 2. Send the customer the address returned by this service.

  # Once the customer has completed the payment, you will receive a webhook notification (configurable in Management API).
  # This notification will contain the status of the payment.
  #
  class Payment < Base
    # Creates a new payment request.
    # https://cryptomate.me/docs/payments#create-payments-request
    # @param [String] token_address (Address of the contract from the token to transfer.)
    # @param [double] amount (Amount of the selected asset to be payed.)
    # @param [String] blockchain (Blockchain to create the payment.)
    # Response:
    # {
    #   "id": "String",
    #   "token_address": "String",
    #   "wallet_address": "String",
    #   "amount": "Decimal",
    # }
    def create_payments_request(token_address, amount, blockchain)
      self.class.post('/commerce/payments/create', body: { token_address:, amount:, blockchain: }.to_json)
    end

    # Returns all the pending payments.
    # https://cryptomate.me/docs/payments#pending-payments
    # Response:
    # [
    #   {
    #     "id": "String",
    #     "token_address": "String",
    #     "wallet_address": "String",
    #     "amount": "Decimal",
    #   }
    # ]
    def pending_payments
      self.class.get('/commerce/payments/list')
    end

    # Retrieves all the listed tokens to create payments. In the response you will see the token name and it's address on the blockchain.
    # https://cryptomate.me/docs/payments#get-listed-tokens
    # @param [String] blockchain (Blockchain to get the listed tokens.)
    # Response:
    # {
    #   "Token name 1": "String",
    #   "Token name 2": "String",
    # }
    def get_listed_tokens(blockchain)
      self.class.get("/commerce/payments/#{blockchain}/tokens")
    end
  end
end
