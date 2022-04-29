class OysterCard
  attr_reader :balance, :journey
  MAX_BALANCE = 90
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @fare = MIN_FARE
    @journey = Journey.new
  end 

  def top_up(money)
    raise "Cannot exceed £#{MAX_BALANCE} balance" if max_balance_exceeded?(money)
    @balance += money
  end

  def touch_in(start_station)
    raise 'Balance insufficient' if balance_insufficient?
    @journey.start(start_station)
  end

  def touch_out(end_station)
    deduct(fare)
    @journey.end(end_station)
  end

  private

  attr_reader :fare

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