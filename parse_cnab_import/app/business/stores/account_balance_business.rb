module Stores
  class AccountBalanceBusiness
    def initialize(options)
      @financial_transactions = options.fetch(:financial_transactions)
    end

    def totalized
      financial_transactions.sum(:amount)
    end

    private
    attr_accessor :financial_transactions
  end
end
