require 'rails_helper'

RSpec.describe "FinancialTransactions::Lists", type: :request do

  describe "GET /index" do
    let(:file) do
      Rack::Test::UploadedFile.new(
          Rails.root.join("spec", "services", "file", "CNAB.txt"
        )
      )
    end

    subject {
       post '/financial_transactions/imports', params: { file: file }
     }

    context "when file is present and has valid format" do

      before(:each) do
        subject
      end

      it "should has list of the Stores by operations" do
        expect(Store.all.size).to eql(5)
      end
    end
  end
end
