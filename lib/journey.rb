class Journey
  attr_reader :history, :travelled_from
  
  def initialize
    @history = []
    @in_use = false
  end

  def start(station)
    @travelled_from = station
    @in_use = true
  end

  def end(station)
    @travelled_to = station
    @in_use = false
    @history << {start_station: "#{@travelled_from}".to_sym, end_station: "#{station}".to_sym}
  end

  def in_journey?
    @in_use
  end

end


# def start_journey(station)
#   @travelled_from = station
# end

# :travelled_from