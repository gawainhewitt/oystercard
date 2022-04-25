require 'oystercard'

describe OysterCard do
  it 'can display initial balance of 0' do
    expect(subject.balance).to eq (0)
  end

  it 'can be topped up' do
    subject.top_up(35)
    subject.top_up(12)
    expect(subject.balance).to eq (47)
  end

  it 'cannot be topped up above £90' do
    too_much_money = 91
    expect { subject.top_up(too_much_money) }.to raise_error 'Cannot exceed £90 balance'
  end 
  
end