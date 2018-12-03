require 'statement'

class Account

  STARTING_BALANCE = 0.00

  def initialize(statement = Statement.new)
    @balance = STARTING_BALANCE
    @statement = statement
  end

  def current_balance
    '%.2f' % @balance
  end

  def deposit(amount)
    @balance += amount
    @statement.deposit(current_balance,'%.2f' % amount)
  end

  def withdraw(amount)
    @balance -= amount
    @statement.withdraw(current_balance, '%.2f' % amount)
  end

  def view_statement
    @statement.view_statement
  end

end
