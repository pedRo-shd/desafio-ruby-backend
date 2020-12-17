require 'rails_helper'

RSpec.describe FinancialTransactions::Parsers do

  let(:cnab_line_one) do
    File.read(
      Rails.root.join("spec", "services", "file", "CNAB.txt")
    ).lines[0]
  end

  let(:parsers_line_one) do
    described_class.new(cnab_line_one).call
  end

  it "position 1 must be Transaction Kind" do
    expect(parsers_line_one.transaction_kind).to eql(3)
  end

  it "position 2 to 9 and 42 to 47 must be Occurrence Date and Time" do
    expect(parsers_line_one.occurrence_at.to_s).to eql(
      '2019-03-01 15:34:53 UTC'
    )
  end

  it "position 10 to 19 must be Amount" do
    expect(parsers_line_one.amount).to eql(142)
  end

  it "position 20 to 30 must be Document Value" do
    expect(parsers_line_one.document_value).to eql('096.206.760-17')
  end

  it "position 31 to 42 must be  Transaction Card" do
    expect(parsers_line_one.card_number).to eql('4753****3153')
  end

  it "position 49 to 62 must be Store Onwer Name" do
    expect(parsers_line_one.owner).to eql('JOÃO MACEDO')
  end

  it "position 63 to 81 must be Store Brand" do
    expect(parsers_line_one.brand).to eql('BAR DO JOÃO')
  end
end
