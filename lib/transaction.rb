class Transaction

  def initialize(credit, debit, balance)
    @balance = '%.2f' % balance
    @credit = '%.2f' % credit
    @debit = '%.2f' % debit
    @record = transaction_record
  end

  def record
    @record
  end

  private

  def transaction_record
    if @debit == "0.00"
      "#{todays_date} || #{@credit} || || #{@balance}"
    else
      "#{todays_date} || || #{@debit} || #{@balance}"
    end
  end

  def todays_date
    Time.now.strftime("%m/%d/%Y")
  end

end
