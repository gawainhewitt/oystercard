class OysterCard
  attr_reader :balance
  MAXIMUM_BALANCE = 90
  def initialize
    @balance = 0
    @in_use = false
  end 
  def top_up(money)
    raise "Cannot exceed £#{MAXIMUM_BALANCE} balance" if @balance + money > MAXIMUM_BALANCE
    @balance += money
  end
  def deduct(money)
    @balance -= money
  end
  
  def in_journey?
    @in_use
  end 
  
  def touch_in
    @in_use = true
  end
  def touch_out
    @in_use = false
  end
  
end