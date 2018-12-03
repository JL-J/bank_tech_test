require 'account'

describe Account do
  STARTING_BALANCE = '%.2f' % 0.00
  STATMENT = ["date || credit || debit || balance", "02/12/2018 || 100.00 || || 100.00", "02/12/2018 || || 40.00 || 60.00"]
  account = Account.new

  let(:date) { "02/12/2018" }
  before do
    allow(Time).to receive_message_chain(:now, :strftime).and_return(date)
  end

  it "starts with an opening balance of 0" do
    expect(account.current_balance).to eq STARTING_BALANCE
  end
  it "money can be deposited into the account" do
    account.deposit(100.00)
    expect(account.current_balance).to eq '%.2f' % 100.00
  end
  it 'money can be withdrawn from the account' do
    account.withdraw(40.00)
    expect(account.current_balance).to eq '%.2f' %  60.00
  end
  it "returns the account statment with recent transactions" do
    expect(account.view_statement).to eq STATMENT
  end
end
