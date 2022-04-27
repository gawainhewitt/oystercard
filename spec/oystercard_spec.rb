require 'oystercard'

describe OysterCard do
  max_balance = OysterCard::MAXIMUM_BALANCE

  it 'should have a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'should top up by money' do
      expect { subject.top_up(max_balance) }.to change(subject, :balance).by(max_balance)    
    end

    it 'should not allow balance to be topped up above maximum balance' do
      subject.top_up(max_balance)
      expect { subject.top_up(1) }.to raise_error "Cannot exceed £#{max_balance} balance"
    end 

  end

  describe '#deduct' do
    it 'should deduct fare from balance' do
      subject.top_up(max_balance)
      expect { subject.deduct(2) }.to change(subject, :balance).by(-2)
    end
  end

  it 'can touch in' do
    expect(subject).to respond_to(:touch_in)
  end
  
  it 'can touch out' do
    expect(subject).to respond_to(:touch_out)
  end

  it 'knows when it is on a journey' do
    subject.touch_in
    expect(subject.in_journey?).to eq true
  end
end