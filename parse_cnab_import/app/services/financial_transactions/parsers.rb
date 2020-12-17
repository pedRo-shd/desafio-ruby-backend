module FinancialTransactions
  class Parsers
    def initialize(file_read_line)
      @file_read_line = file_read_line
    end

    def call
      CnabForm.new(
        transaction_kind: custom_transaction_kind,
        occurrence_at: custom_occurrence_at,
        amount: custom_amount,
        document_value: custom_document_value,
        card_number: custom_card_number,
        owner: custom_store_owner,
        brand: custom_store_brand
      )
    end

    private

    def custom_transaction_kind
      file_read_line[0].to_i
    end

    def custom_occurrence_at
      Time.zone.parse("#{occurrence_date} #{occurrence_time}")
    end

    def occurrence_date
      "#{file_read_line[1..4]}-#{file_read_line[5..6]}-#{file_read_line[7..8]}"
    end

    def occurrence_time
       "#{file_read_line[42..43]}:#{file_read_line[44..45]}:#{file_read_line[46..47]}"
    end

    def custom_amount
      BigDecimal(file_read_line[9..18]) / 100
    end

    def custom_document_value
      "#{file_read_line[19..21]}.#{file_read_line[22..24]}.#{file_read_line[25..27]}-#{file_read_line[28..29]}"
    end

    def custom_card_number
      file_read_line[30..41]
    end

    def custom_store_owner
      file_read_line[48..61].split(' ').join(' ')
    end

    def custom_store_brand
      file_read_line[62..80].split(' ').join(' ')
    end

    attr_accessor :file_read_line
  end
end
