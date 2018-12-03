class Account

  STARTING_BALANCE = 0

  def initialize
    @balance = STARTING_BALANCE
  end

  def current_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

end
