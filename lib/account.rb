require_relative 'statement'
require_relative 'transaction'

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
    new_transaction(amount, 0)
  end

  def withdraw(amount)
    @balance -= amount
    new_transaction(0, amount)
  end

  def view_statement
    @statement.view_statement
  end

  private

  def new_transaction(credit, debit)
    @transaction = Transaction.new(credit, debit, current_balance)
    @statement.update(@transaction.record)
  end

end
