require 'httparty'

module CryptomateAPI
  module Management
    # Manage the access you give to each key and the permissions you will have for each blockchain,
    # such as only receiving transactions or only accessing one of the blockchains.
    class Credential < CryptomateAPI::Base
      # Get all credentials for an API-Key
      # https://cryptomate.me/docs/management#get-all-credentials-for-a-api-key
      # @param [String] api_key (API-Key to see its credentials.)
      # TODO: check response if it's an array or a hash
      # Response:
      # {
      #   "id": "string",
      #   "key": {
      #     "api_key": "string",
      #     "name": "string"
      #   },
      #   "operation": {
      #     "id": "string",
      #     "description": "string"
      #   }
      # }
      def get_all_credentials(api_key)
        self.class.get("/management/credentials/api-key/#{api_key}")
      end

      # Get a credential information by id
      # https://cryptomate.me/docs/management#get-a-credential-information
      # @param [String] credential_id (Credential id to see its information.)
      # Response:
      # {
      #   "id": "string",
      #   "key": {
      #     "api_key": "string",
      #     "name": "string"
      #   },
      #   "operation": {
      #     "id": "string",
      #     "description": "string"
      #   }
      # }
      def get_credential(credential_id)
        self.class.get("/management/credentials/#{credential_id}")
      end

      # Creates a credential for a API-Key and operation.
      # https://cryptomate.me/docs/management#create-a-credential
      # @param [String] api_key (API-Key to create the credential on.)
      # @param [String] operation_id (Id of the operation to give credential.)
      # Response:
      # {
      #   "id": "string",
      #   "key": {
      #     "api_key": "string",
      #     "name": "string"
      #   },
      #   "operation": {
      #     "id": "string",
      #     "description": "string"
      #   }
      # }
      def create_credential(api_key, operation_id)
        self.class.post("/management/credentials", body: { api_key:, operation_id: }.to_json)
      end

      # Modifies a credential by ID.
      # https://cryptomate.me/docs/management#update-a-credential
      # @param [String] credential_id (Id of the credential to modify.)
      # @param [String] api_key (Api-key to modify its credential.)
      # @param [String] operation_id (Id of the operation.)
      # Response:
      # {
      #   "id": "string",
      #   "key": {
      #     "api_key": "string",
      #     "name": "string"
      #   },
      #   "operation": {
      #     "id": "string",
      #     "description": "string"
      #   }
      # }
      def update_credential(credential_id, api_key, operation_id)
        self.class.put("/management/credentials/#{credential_id}", body: { api_key:, operation_id: }.to_json)
      end

      # Deletes a credential by ID.
      # https://cryptomate.me/docs/management#delete-a-credential
      # @param [String] credential_id (Id of the credential to delete.)
      def delete_credential(credential_id)
        self.class.delete("/management/credentials/#{credential_id}")
      end
    end
  end
end
