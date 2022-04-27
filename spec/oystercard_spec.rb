require 'oystercard'

describe OysterCard do
  it 'should have a default balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it 'should top up by money' do
      expect { subject.top_up(35) }.to change(subject, :balance).by(35)    
    end

    it 'cannot be topped up above maximum balance' do
      max_balance = OysterCard::MAXIMUM_BALANCE
      expect { subject.top_up(max_balance + 1) }.to raise_error "Cannot exceed £#{max_balance} balance"
    end 

  end

    it 'can deduct money' do
      subject.top_up(32)
      expect(subject.deduct(2)).to eq 30
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