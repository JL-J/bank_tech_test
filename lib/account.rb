class Account

  STARTING_BALANCE = 0.00

  def initialize
    @balance = STARTING_BALANCE
    @statment = ["date || credit || debit || balance"]
  end

  def current_balance
    '%.2f' % @balance
  end

  def deposit(amount)
    @balance += amount
    update_statment("credit", '%.2f' % amount)
  end

  def withdraw(amount)
    @balance -= amount
    update_statment("debit", '%.2f' % amount)
  end

  def view_statement
    @statment
  end

  private

  def update_statment(action, amount)
    if action == "credit"
      @statment.push("#{todays_date} || #{amount} || || #{current_balance}")
    else
      @statment.push("#{todays_date} || || #{amount} || #{current_balance}")
    end
  end

  def todays_date
    Time.now.strftime("%m/%d/%Y")
  end

end
