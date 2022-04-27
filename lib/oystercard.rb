class OysterCard
  attr_reader :balance
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
  end 

  def top_up(money)
    raise "Cannot exceed £#{MAX_BALANCE} balance" if max_balance_exceeded?(money)
    @balance += money
  end

  def deduct(fare)
    @balance -= fare
  end
  
  def in_journey?
    @in_use
  end 
  
  def touch_in
    raise 'Balance below minimum fare' if balance_insufficient?
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  private

  def max_balance_exceeded?(money)
    balance + money > MAX_BALANCE
  end

  def balance_insufficient?
    balance < MIN_FARE
  end
  
end