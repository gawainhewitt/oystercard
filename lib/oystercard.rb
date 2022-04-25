class OysterCard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  def initialize
    @balance = 0
  end 
  def top_up(money)
    raise "Cannot exceed £#{MAXIMUM_BALANCE} balance" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end
end