require 'rails_helper'

RSpec.describe Stores::AccountBalanceBusiness do
  before(:each) do
    FinancialTransactionBusiness.new(
      file: Rack::Test::UploadedFile.new(
          Rails.root.join("spec", "services", "file", "CNAB.txt")
      )
    ).save!
  end

  let(:store_one) { Store.first }

  let(:financial_transactions) do
      FinancialTransaction.joins(
        :store
      ).includes(
        :store
      ).where(store_id: store_one.id)
  end

  let(:totalized) do
    described_class.new(financial_transactions: financial_transactions).totalized
  end

  it "BAR DO JOÃO Store should has x totalized" do
    expect(FinancialTransaction.where(store_id: store_one).sum(:amount)).to eql(
      totalized
    )
  end
end
