module FinancialTransactions
  class ListsController < ApplicationController
    def index
      render :index, stores: stores
    end

    def show
      render :show, locals: {
        store: store,
        account_balance_totalized: account_balance_totalized,
        financial_transactions: financial_transactions
      }
    end

    private

    def stores
      @stores ||= Store.all
    end

    def account_balance_totalized
      Stores::AccountBalanceBusiness.new(
        financial_transactions: financial_transactions
      ).totalized
    end

    def financial_transactions
      @financial_transactions ||=
        FinancialTransaction.joins(
          :store
        ).includes(
          :store
        ).where(store_id: store.id)
    end

    def store
      @store ||= Store.find params[:store_id]
    end
  end
end
