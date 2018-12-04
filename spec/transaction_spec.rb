require 'transaction'

describe Transaction do
  let(:date) { "02/12/2018" }

  before do
    allow(Time).to receive_message_chain(:now, :strftime).and_return(date)
  end

  describe "#record" do
    it "returns the record of a new credit transaction" do
      STATEMENT_1 = "02/12/2018 || 100.00 || || 100.00"
      transaction_1 = Transaction.new(100, 0, 100)
      expect(transaction_1.record).to eq STATEMENT_1
    end
    it "returns the record of a new debit transaction" do
      STATEMENT_2 = "02/12/2018 || || 60.00 || 40.00"
      transaction_2 = Transaction.new(0, 60, 40)
      expect(transaction_2.record).to eq STATEMENT_2
    end
  end

end
