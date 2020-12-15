class CreateFinancialTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :financial_transactions do |t|
      t.integer :transaction_kind
      t.decimal :amount
      t.string :document_value
      t.string :card_number
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
