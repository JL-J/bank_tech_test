class Statement

  def initialize
    record_header = "date || credit || debit || balance"
    @record = [record_header]
  end

  def view_statement
    @record
  end

  def update(transaction_record)
    @record << transaction_record
  end

end
