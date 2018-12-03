class Statement

  def initialize
    statement_header = "date || credit || debit || balance"
    @statement = [statement_header]
  end

  def view_statement
    @statement
  end

  def deposit(current_balance, amount)
    @statement.push("#{todays_date} || #{'%.2f' % amount} || || #{'%.2f' % current_balance}")
  end

  def withdraw(current_balance, amount)
    @statement.push("#{todays_date} || || #{'%.2f' % amount} || #{'%.2f' % current_balance}")
  end

  private

  def todays_date
    Time.now.strftime("%m/%d/%Y")
  end

end
