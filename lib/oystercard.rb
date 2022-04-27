class OysterCard
  attr_reader :balance, :fare, :travelled_from
  MAX_BALANCE = 90
  MIN_FARE = 1

  def initialize
    @balance = 0
    @in_use = false
    @fare = MIN_FARE
    @travelled_from = :test_start_station
  end 

  def top_up(money)
    raise "Cannot exceed £#{MAX_BALANCE} balance" if max_balance_exceeded?(money)
    @balance += money
  end
  
  def in_journey?
    @in_use
  end 
  
  def touch_in
    raise 'Balance insufficient' if balance_insufficient?
    @in_use = true
  end

  def touch_out
    deduct(fare)
    @in_use = false
  end

  private

  def max_balance_exceeded?(money)
    balance + money > MAX_BALANCE
  end

  def balance_insufficient?
    balance < MIN_FARE
  end

  def deduct(fare)
    @balance -= fare
  end
  
end