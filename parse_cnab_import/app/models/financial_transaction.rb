class FinancialTransaction < ApplicationRecord
  belongs_to :store

  enum transaction_kind: %i[
    t_empty
    debit
    bank_slip
    financing
    credit
    loan_receipt
    sales
    ted_receipt
    doc_receipt
    rent
  ]

  before_save :formated_amount_transaction_operation

  private

  def formated_amount_transaction_operation
    self.amount = -self.amount if ["bank_slip", "financing", "rent"].any? { |i| [transaction_kind].include? i }
  end
end
