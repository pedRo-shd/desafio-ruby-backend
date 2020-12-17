class AddDateHoursToFinancialTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :financial_transactions, :occurrence_at, :datetime
  end
end
