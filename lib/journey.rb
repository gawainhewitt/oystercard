class Journey
  attr_reader :history, :travelled_from, :journey
  
  def initialize
    @history = []
    @journey = {}
    @in_use = false
  end

  def start(station)
    # @travelled_from = station
    @journey[:start_station] = "#{station}".to_sym
    @in_use = true
  end
  
  def end(station)
    # @travelled_to = station
    @journey[:end_station] = "#{station}".to_sym
    @in_use = false
    @history << @journey
  end

  def in_journey?
    @in_use
  end

end
