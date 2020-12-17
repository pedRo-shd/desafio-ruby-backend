module FinancialTransactions
  class ImportsController < ApplicationController

    def new
      render_new
    end

    def create
      financial_transactions_business.save!
      redirect_to financial_transactions_lists_path
    end

    private

    def render_new
      render :new
    end

    def financial_transactions_business
      raise 'Arquivo está vázio, tente novamente!' if params[:file].blank?

      FinancialTransactionBusiness.new(
        file: params[:file]
      )
    end
  end
end
