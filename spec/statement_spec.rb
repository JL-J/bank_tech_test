require 'statement'

describe Statement do
  let(:date) { "02/12/2018" }
  subject { Statement.new }

  before do
    allow(Time).to receive_message_chain(:now, :strftime).and_return(date)
  end

  describe "#view_statement" do
    it "returns the statment" do
      STATEMENT_0 = ["date || credit || debit || balance"]
      expect(subject.view_statement).to eq STATEMENT_0
    end
  end

  describe "#deposit" do
    it "updates the statment when a deposit is made" do
      STATEMENT_1 = ["date || credit || debit || balance", "02/12/2018 || 100.00 || || 100.00"]
      subject.deposit(100.00, 100.00)
      expect(subject.view_statement).to eq STATEMENT_1
    end
  end

  describe "#withdraw" do
    it "updates the statment when a withdrawal is made" do
      STATEMENT_2 = ["date || credit || debit || balance", "02/12/2018 || || 40.00 || 60.00"]
      subject.withdraw(60.00, 40.00)
      expect(subject.view_statement).to eq STATEMENT_2
    end
  end
end
