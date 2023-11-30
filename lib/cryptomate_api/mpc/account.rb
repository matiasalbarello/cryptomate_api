# frozen_string_literal: true

module CryptomateApi
  module Mpc
    # The accounts module allows you to create and manage multiple accounts, each with their own wallets.
    # This allows you to manage your crypto assets in a more organized manner,
    # and also allows you to create multiple wallets for the same or different blockchain.
    class Account < CryptomateApi::Base
      # Get all accounts
      # https://cryptomate.me/docs/mpc#get-all-accounts
      # TODO: check response if it's an array or a hash
      # Response:
      # {
      #   "id": "string",
      #   "alias": "string",
      #   "wallets": [
      #     {
      #       "id": "string",
      #       "alias": "string",
      #       "wallet_address": "string",
      #       "blockchain": "string"
      #     }
      #   ]
      # }
      def get_all_accounts
        self.class.get('/mpc/accounts/list')
      end

      # Create an account
      # https://cryptomate.me/docs/mpc/create-an-account
      # @param [String] alias_name (Alias name of the account to create.)
      # Response:
      # {
      #   "id": "String",
      #   "alias": "String",
      #   "wallets": []
      # }
      def create_account(alias_name)
        self.class.post('/mpc/accounts/create', body: { alias: alias_name }.to_json)
      end

      # Edit account: Modifies the account information.
      # https://cryptomate.me/docs/mpc/edit-account
      # @param [String] account_id (Id of the account to edit.)
      # @param [String] alias_name (New alias name of the account.)
      # Response:
      # {
      #   "id": "string",
      #   "alias": "string",
      #   "wallets": [
      #     {
      #       "id": "string",
      #       "alias": "string",
      #       "wallet_address": "string",
      #       "blockchain": "string"
      #     }
      #   ]
      # }
      def edit_account(account_id, alias_name)
        self.class.put("/mpc/account/#{account_id}", body: { alias: alias_name }.to_json)
      end

      # Delete account
      # https://cryptomate.me/docs/mpc/delete-account
      # @param [String] account_id (Id of the account to delete.)
      def delete_account(account_id)
        self.class.delete("/mpc/account/#{account_id}")
      end
    end
  end
end
