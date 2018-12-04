require 'account'

describe Account do
  let(:stub_statement) { double(:statement, statement: []) }
  subject { Account.new(stub_statement) }

  describe "#current_balance" do
    it "starts with an opening balance of 0" do
      expect(subject.current_balance).to eq '%.2f' % 0.00
    end
  end

  describe "#deposit" do
    it "money can be deposited into the account" do
      expect(stub_statement).to receive(:update)
      subject.deposit(100.00)
      expect(subject.current_balance).to eq '%.2f' % 100.00
    end
  end

  describe "#withdraw" do
    it 'money can be withdrawn from the account' do
      expect(stub_statement).to receive(:update)
      subject.withdraw(40.00)
      expect(subject.current_balance).to eq '%.2f' % -40.00
    end
  end

  describe "#view_statement" do
    it "returns the account statement with recent transactions" do
      STATEMENT = ["date || credit || debit || balance", "02/12/2018 || 100.00 || || 100.00", "02/12/2018 || || 40.00 || 60.00"]
      expect(stub_statement).to receive(:view_statement).and_return(STATEMENT)
      expect(subject.view_statement).to eq STATEMENT
    end
  end
end
