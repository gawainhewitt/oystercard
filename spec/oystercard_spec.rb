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
        expect { subject.touch_in(:test_start_station) }.to raise_error "Balance insufficient"
      end
    end
  end

  describe '#touch_out' do
    before(:example) do
      subject.top_up(max_balance) 
      subject.touch_in(:test_start_station)
    end

    it 'deducts correct amount from card at end of journey' do
      expect { subject.touch_out(:test_end_station)}.to change(subject, :balance).by(-subject.fare)
    end
  end

  describe '#test_start_station' do
    before(:example) { subject.top_up(max_balance) }
    let(:test_end_station) {double :station}
  end

  it 'should return the penalty fare if journey is incomplete' do
    subject.top_up(max_balance)
    subject.touch_in(:test_start_station)
    expect(subject.fare).to eq(OysterCard::PENALTY_FARE)
  end

end