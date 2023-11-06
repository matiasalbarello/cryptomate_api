require 'httparty'

module CryptomateAPI
  class Client
    include HTTParty
    base_uri 'https://cryptomate.me/api'

    def initialize(api_key)
      @api_key = api_key
      self.class.headers "Authorization" => "Bearer #{api_key}"
    end

    # Get a list of all currencies
    def get_currencies
      self.class.get("/currencies")
    end

    # Get a specific currency by ID
    def get_currency(id)
      self.class.get("/currencies/#{id}")
    end

    # Create a new transaction
    def create_transaction(currency_id, user_id, amount)
      self.class.post("/transactions", body: { currency_id: currency_id, user_id: user_id, amount: amount })
    end

    # Get a specific transaction by ID
    def get_transaction(id)
      self.class.get("/transactions/#{id}")
    end

    # Get all transactions for a specific currency
    def get_transactions_by_currency(id)
      self.class.get("/currencies/#{id}/transactions")
    end

    # Get all transactions for a specific user
    def get_transactions_by_user(id)
      self.class.get("/users/#{id}/transactions")
    end

    # Get a list of all users
    def get_users
      self.class.get("/users")
    end

    # Get a specific user by ID
    def get_user(id)
      self.class.get("/users/#{id}")
    end

    # Handle other endpoints as needed...
  end
end
