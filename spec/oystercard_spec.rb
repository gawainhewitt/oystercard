require 'oystercard'

describe OysterCard do
  max_balance = OysterCard::MAX_BALANCE

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

  describe '#touch_in' do
    context 'when the balance is below the minimum fare' do
      it 'should not allow the user to touch in' do
        expect { subject.touch_in }.to raise_error "Balance insufficient"
      end
    end
  end

  describe '#touch_out' do
    it 'deducts correct amount from card at end of journey' do
      subject.top_up(5)
      subject.touch_in
      expect { subject.touch_out }.to change(subject, :balance).by(-OysterCard::MIN_FARE)
    end
  end

  it 'knows when it is on a journey' do
    subject.top_up(max_balance)
    expect { subject.touch_in }.to change(subject, :in_journey?).to true
  end

  it 'should return the station travelled from' do
    subject.top_up(max_balance)
    subject.touch_in
    expect(subject.travelled_from).to be(:test_start_station)
  end

end