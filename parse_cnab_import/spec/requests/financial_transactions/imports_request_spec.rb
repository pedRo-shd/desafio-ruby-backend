require 'rails_helper'

RSpec.describe "FinancialTransactions::Imports", type: :request do

  describe "POST /create" do
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
      it "should redirect to FinancialTransactions::Lists" do
        expect(subject).to redirect_to(financial_transactions_lists_path)
      end

      let(:financial_transaction) { FinancialTransaction.all }
      let(:financial_transaction_second) { financial_transaction.second }
      let(:financial_transaction_amount_negative) { financial_transaction[2] }

      before(:each) do
        subject
      end

      it "should record financial transactions" do
        expect(financial_transaction.size).to eql(21)
      end

      it "FinancialTransaction second should has match with second line" do
        expect(financial_transaction_second.transaction_kind_before_type_cast).to eql(5)
        expect(financial_transaction_second.amount).to eql(132)
        expect(financial_transaction_second.document_value).to eql('556.418.150-63')
        expect(financial_transaction_second.card_number).to eql('3123****7687')
        expect(financial_transaction_second.store.owner).to eql('MARIA JOSEFINA')
        expect(financial_transaction_second.store.brand).to eql('LOJA DO Ó - MATRIZ')
      end

      it "FinancialTransaction has amount negative" do
        expect(financial_transaction_amount_negative.transaction_kind_before_type_cast).to eql(3)
        expect(financial_transaction_amount_negative.amount).to eql(-122)
      end
    end
  end
end
