require 'account'

describe Account do
  STARTING_BALANCE = 0
  account = Account.new

  it "starts with an opening balance of 0" do
    expect(account.current_balance).to eq STARTING_BALANCE
  end
  it "money can be deposited into the account" do
    account.deposit(100)
    expect(account.current_balance).to eq 100
  end
end
