require_relative 'statement'
require_relative 'transaction'

class Account

  STARTING_BALANCE = 0.00

  def initialize(statement = Statement.new, transactions = Transaction)
    @balance = STARTING_BALANCE
    @statement = statement
    @transactions = transactions
  end

  def current_balance
    '%.2f' % @balance
  end

  def deposit(amount)
    check_amount(amount)
    @balance += amount
    new_transaction(amount, 0)
  end

  def withdraw(amount)
    check_amount(amount)
    @balance -= amount
    new_transaction(0, amount)
  end

  def view_statement
    @statement.view_statement
  end

  private

  def check_amount(amount)
    fail "Please enter numbers only" if !((amount.is_a? Integer) | (amount.is_a? Float))
    fail "The amount entered cannot be equal to 0" if (amount.to_i == 0)
    fail "Please enter the amount as a positive number" if (amount.to_i < 0)
  end

  def new_transaction(credit, debit)
    @new_transaction = @transactions.new(credit, debit, current_balance)
    @statement.update(@new_transaction.record)
  end

end
