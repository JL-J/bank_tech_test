require 'statement'

describe Statement do

  STATEMENT_1 = ["date || credit || debit || balance", "02/12/2018 || 100.00 || || 100.00"]
  STATEMENT_2 = ["date || credit || debit || balance", "02/12/2018 || 100.00 || || 100.00", "02/12/2018 || || 40.00 || 60.00"]

  statement = Statement.new
  let(:date) { "02/12/2018" }

  before do
    allow(Time).to receive_message_chain(:now, :strftime).and_return(date)
  end

  it "updates the statment when a deposit is made" do
    statement.deposit(100.00, 100.00)
    expect(statement.view_statement).to eq STATEMENT_1
  end
  it "updates the statment when a withdrawal is made" do
    statement.withdraw(60.00, 40.00)
    expect(statement.view_statement).to eq STATEMENT_2
  end

end
