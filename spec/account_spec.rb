require 'account'

describe Account do
  STARTING_BALANCE = 0
  account = Account.new

  it "starts with an opening balance of 0" do
    expect(account.current_balance).to eq STARTING_BALANCE
  end
end
