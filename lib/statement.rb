class Statement

  def initialize
    @record_header = ["date || credit || debit || balance"]
    @record = []
  end

  def view_statement
    @record_header + @record.reverse
  end

  def update(transaction_record)
    @record << transaction_record
  end

end
