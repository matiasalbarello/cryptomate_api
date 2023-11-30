# frozen_string_literal: true

module CryptomateApi
  module Management
    # Get all the operations available in the platform.
    # You can use this information to create new credentials for your clients.
    class Operation < CryptomateApi::Base
      class << self
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
          get('/management/operations/list')
        end

        # Get a specific operation
        # https://cryptomate.me/docs/management#get-a-operation
        # Response:
        # {
        #   "id": "string",
        #   "description": "string"
        # }
        def get_operation(operation_id)
          get("/management/operations/#{operation_id}")
        end
      end
    end
  end
end
