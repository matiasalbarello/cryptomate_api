
module CryptomateAPI
  module Management
    # Manage the api-keys of your clients.
    # You can create, modify and delete them.
    # This api-keys are used to authenticate the clients in the platform.
    class Key < CryptomateAPI::Base
      # Get all keys
      # https://cryptomate.me/docs/management#get-all-keys
      # Response:
      # [
      #   {
      #     "api_key": "string",
      #     "name": "string"
      #   }
      # ]
      def get_all_keys
        self.class.get("/management/keys/list")
      end

      # Get a specific key
      # https://cryptomate.me/docs/management#get-a-key
      # Response:
      # [
      #   {
      #     "api_key": "string",
      #     "name": "string"
      #   }
      # ]
      def get_key(key_id)
        self.class.get("/management/keys/#{key_id}")
      end

      # Create a key
      # https://cryptomate.me/docs/management#create-a-key
      # @param [String] name (Alias name of the API-Key to create.)
      # Response:
      # [
      #   {
      #     "api_key": "string",
      #     "name": "string"
      #   }
      # ]
      def create_key(name)
        self.class.post("/management/keys/create", body: { name: }.to_json)
      end

      # Modify a key
      # https://cryptomate.me/docs/management#modify-a-key
      # @param [String] key_name (Name of the key to modify.)
      # @param [String] new_api_key_value (New api-key value.)
      # Response:
      # [
      #   {
      #     "api_key": "string",
      #     "name": "string"
      #   }
      # ]
      def modify_key(key_name, new_api_key_value)
        self.class.put("/management/keys/#{key_name}", body: { api_key: new_api_key_value }.to_json)
      end

      # Delete a key
      # https://cryptomate.me/docs/management#delete-a-key
      # @param [String] api_key (Id of the API-Key. Ex: master-ac8ff424-426f-46a7-94c3-13932c6e8adf)
      def delete_key(api_key)
        self.class.delete("/management/keys/#{api_key}")
      end
    end
  end
end
