require 'account'

describe Account do
  let(:stub_statement) { double(:statement, statement: []) }
  let(:stub_transactions) { double(:transactions) }
  let(:stub_new_transaction) { double(:new_transaction) }
  subject { Account.new(stub_statement, stub_transactions) }

  describe "#current_balance" do
    it "starts with an opening balance of 0" do
      expect(subject.current_balance).to eq '%.2f' % 0.00
    end
  end

  describe "#deposit" do
    it "money can be deposited into the account" do
      expect(stub_statement).to receive(:update)
      expect(stub_transactions).to receive(:new).and_return(stub_new_transaction)
      expect(stub_new_transaction).to receive(:record)
      subject.deposit(100.00)
      expect(subject.current_balance).to eq '%.2f' % 100.00
    end
  end

  describe "#withdraw" do
    it 'money can be withdrawn from the account' do
      expect(stub_statement).to receive(:update)
      expect(stub_transactions).to receive(:new).and_return(stub_new_transaction)
      expect(stub_new_transaction).to receive(:record)
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

  describe "Edge cases:" do
    it "An error is thrown during #deposit if the amount entered is not an Integer or a Float" do
      expect{subject.deposit("fifty pounds")}.to raise_error("Please enter numbers only")
    end
    it "An error is thrown during #withdraw if the amount entered is not an Integer or a Float" do
      expect{subject.withdraw("money")}.to raise_error("Please enter numbers only")
    end
    it "An error is thrown if the amount entered during #deposit is 0" do
      expect{subject.deposit(0)}.to raise_error("The amount entered cannot be equal to 0")
    end
    it "An error is thrown if the amount entered during #withdraw is 0" do
      expect{subject.withdraw(0)}.to raise_error("The amount entered cannot be equal to 0")
    end
    it "An error is thrown during #deposit if a negative amount is entered" do
      expect{subject.deposit(-49.99)}.to raise_error("Please enter the amount as a positive number")
    end
  end
end
