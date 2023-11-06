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
    # API documentation: https://cryptomate.me/docs#currencies
    def get_currencies
      self.class.get("/currencies")
    end

    # Get a specific currency by ID
    # API documentation: https://cryptomate.me/docs#currencies-id
    def get_currency(id)
      self.class.get("/currencies/#{id}")
    end

    # Create a new transaction
    # API documentation: https://cryptomate.me/docs#transactions-create
    def create_transaction(currency_id, user_id, amount)
      self.class.post("/transactions", body: { currency_id: currency_id, user_id: user_id, amount: amount })
    end

    # Get a specific transaction by ID
    # API documentation: https://cryptomate.me/docs#transactions-id
    def get_transaction(id)
      self.class.get("/transactions/#{id}")
    end

    # Get all transactions for a specific currency
    # API documentation: https://cryptomate.me/docs#currencies-id-transactions
    def get_transactions_by_currency(id)
      self.class.get("/currencies/#{id}/transactions")
    end

    # Get all transactions for a specific user
    # API documentation: https://cryptomate.me/docs#users-id-transactions
    def get_transactions_by_user(id)
      self.class.get("/users/#{id}/transactions")
    end

    # Get a list of all users
    # API documentation: https://cryptomate.me/docs#users
    def get_users
      self.class.get("/users")
    end

    # Get a specific user by ID
    # API documentation: https://cryptomate.me/docs#users-id
    def get_user(id)
      self.class.get("/users/#{id}")
    end
  end
end
