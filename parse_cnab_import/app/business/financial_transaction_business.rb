class FinancialTransactionBusiness
  def initialize(options)
    @file = File.open(options.fetch(:file))
  end

  def save!
    file.each do |line|
      financial_transaction_build!(financial_transactions_parsers(line))
    end
  end

  private
  attr_accessor :file

  def financial_transactions_parsers(line)
    FinancialTransactions::Parsers.new(
      line
    ).call
  end

  def financial_transaction_build!(object_interpreted)
    attr_object_interpreted = object_interpreted.attributes
    attr_object_interpreted.delete 'owner'
    attr_object_interpreted.delete 'brand'

    store = store_find_or_create(object_interpreted)
    
    financial_transaction = FinancialTransaction.new
    financial_transaction.assign_attributes(attr_object_interpreted)
    financial_transaction.store_id = store.id
    financial_transaction.save!
  end

  def store_find_or_create(object_interpreted)
    Store.find_or_create_by(
      owner: object_interpreted.owner,
      brand: object_interpreted.brand
    )
  end
end
