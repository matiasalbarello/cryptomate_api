# frozen_string_literal: true

module CryptomateApi
  module Mpc
    # The accounts module allows you to create and manage multiple accounts, each with their own wallets.
    # This allows you to manage your crypto assets in a more organized manner,
    # and also allows you to create multiple wallets for the same or different blockchain.
    class Wallet < CryptomateAPI::Base
      # Get a wallet: Retrieves a wallet by ID.
      # https://cryptomate.me/docs/mpc/get-a-wallet
      # @param [String] account_id (Id of the account to get the wallet from.)
      # @param [String] wallet_id (Id of the wallet to get.)
      # Response:
      # {
      #   "id": "string",
      #   "alias": "string",
      #   "wallet_address": "string",
      #   "blockchain": "string"
      # }
      def get_wallet(account_id, wallet_id)
        self.class.get("/mpc/accounts/#{account_id}/wallets/#{wallet_id}")
      end

      # Get all wallets for an account
      # https://cryptomate.me/docs/mpc/get-all-wallets
      # @param [String] account_id (Id of the account to get the wallets from.)
      # TODO: check response if it's an array or a hash
      # Response:
      # {
      #   "id": "string",
      #   "alias": "string",
      #   "wallet_address": "string",
      #   "blockchain": "string"
      # }
      def get_all_wallets(account_id)
        self.class.get("/mpc/accounts/#{account_id}/wallets/list")
      end

      # Create a new wallet for an account
      # https://cryptomate.me/docs/mpc/create-a-wallet
      # @param [String] account_id (Id of the account to create the wallet on.)
      # @param [String] alias_name (Alias name of the wallet to create.)
      # @param [String] blockchain (Blockchain of the wallet to create.)
      # Response:
      # {
      #   "id": "string",
      #   "alias": "string",
      #   "wallet_address": "string",
      #   "blockchain": "string"
      # }
      def create_wallet(account_id, alias, blockchain)
        self.class.post("/mpc/accounts/#{account_id}/wallets/create", body: { alias:, blockchain: }.to_json)
      end

      # Update a wallet: Modifies the wallet information.
      # https://cryptomate.me/docs/mpc/update-wallet
      # @param [String] account_id (Id of the account to update the wallet on.)
      # @param [String] wallet_id (Id of the wallet to update.)
      # @param [String] alias (Alias to identify the wallet to update.)
      # Response:
      # {
      #   "id": "string",
      #   "alias": "string",
      #   "wallet_address": "string",
      #   "blockchain": "string"
      # }
      def update_wallet(account_id, wallet_id, alias)
        self.class.put("/mpc/accounts/#{account_id}/wallets/#{wallet_id}", body: { alias: }.to_json)
      end

      # Transfer Token
      # Transfer any of the listed tokens that are in your MPC wallet to another wallet (internal or external).
      # The status determines the transaction state. Normally, the service will return SUCCESSFUL or FAILED.
      # In some cases, if the blockchain is congested, the service may return a PENDING state, which means that
      # the transaction is still waiting to be processed. But sometimes, due to variations in gas prices from
      # block to block, a transaction may be in a state where it was sent to be processed but the blockchain did
      # not program it to be executed. In these cases, the transaction will be marked as MANUAL_CHECK and will
      # need to be verified manually.
      # https://cryptomate.me/docs/mpc/transfer-token
      # @param [String] account_id (Id of the account to transfer the token from.)
      # @param [String] wallet_id (Id of the wallet to transfer the token from.)
      # @param [String] token_address (Address of the contract for the token to transfer. This address can be obtained from the listed token API.)
      # @param [String] amount (Amount of the selected asset to be send. Ex: 123.45.)
      # @param [String] to (Address of the receiver wallet.)
      # Response:
      # {
      #   "transaction_hash": "string",
      #   "status": "success|failed|pending|manual_check"
      # }
      def transfer_token(account_id, wallet_id, token_address, amount, to)
        self.class.post(
          "/mpc/accounts/#{account_id}/wallets/#{wallet_id}/transfer",
          body: { token_address:, amount:, to: }.to_json
        )
      end

      # Get balance
      # https://cryptomate.me/docs/mpc#balance
      # Returns the balance of all the listed tokens from the blockchain of a wallet,
      # with the amount of them even if they are 0.
      # @param [String] account_id (Id of the account to get the balance from.)
      # @param [String] wallet_id (Id of the wallet to get the balance from.)
      # Response:
      # [
      #   {
      #     "name": "string",
      #     "symbol": "string",
      #     "balance": 0.0,
      #     "token_address": "string"
      #   }
      # ]
      def get_balance(account_id, wallet_id)
        self.class.get("/mpc/accounts/#{account_id}/wallets/#{wallet_id}/balance")
      end
    end
  end
end
