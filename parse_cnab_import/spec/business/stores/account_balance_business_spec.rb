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

  let(:totalized) do
    described_class.new(store_one).totalized
  end

  it "BAR DO JOÃO Store should has x totalized" do
    expect(FinancialTransaction.where(store_id: 1).sum(:amount)).to eql(
      totalized
    )
  end
end
