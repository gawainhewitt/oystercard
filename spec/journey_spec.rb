require 'journey'

describe Journey do
  let(:test_start_station) {double :station}
  let(:test_end_station) {double :station}


  it 'should know when an Oystercard is on a journey' do

    oystercard = OysterCard.new
    oystercard.top_up(OysterCard::MAX_BALANCE)
    expect { oystercard.touch_in(:test_start_station) }.to change(oystercard.journey, :in_journey?).to true
  end
  it 'can store previous trips' do
    oystercard = OysterCard.new
    oystercard.top_up(OysterCard::MAX_BALANCE)
    oystercard.touch_in(:test_start_station)
    expect { oystercard.touch_out(:test_end_station) }.to change(oystercard.journey, :history).from([]).to([{start_station: :test_start_station, end_station: :test_end_station}])
  end

  
end