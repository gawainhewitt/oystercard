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
  
end