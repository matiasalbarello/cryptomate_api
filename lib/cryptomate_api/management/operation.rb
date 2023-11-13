require 'httparty'

module CryptomateAPI
  module Management
    # Get all the operations available in the platform.
    # You can use this information to create new credentials for your clients.
    class Operation < CryptomateAPI::Base
      # Get all operations
      # https://cryptomate.me/docs/management#get-all-operations
      # Response:
      # [
      #   {
      #     "id": "string",
      #     "description": "string"
      #   }
      # ]
      def get_all_operations
        self.class.get("/management/operations/list")
      end

      # Get a specific operation
      # https://cryptomate.me/docs/management#get-a-operation
      # Response:
      # {
      #   "id": "string",
      #   "description": "string"
      # }
      def get_operation(operation_id)
        self.class.get("/management/operations/#{operation_id}")
      end
    end
  end
end
