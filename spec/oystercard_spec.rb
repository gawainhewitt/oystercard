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

  it 'cannot be topped up above maximum balance' do
    expect { subject.top_up(OysterCard::MAXIMUM_BALANCE + 1) }.to raise_error 'Cannot exceed £90 balance'
  end 

  it 'can deduct money' do
    subject.top_up(32)
    expect(subject.deduct(2)).to eq 30
  end
  
end