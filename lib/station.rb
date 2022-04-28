class Station 
  attr_reader :details

  def initialize(station_name, zone)
    # @station_name = station_name
    # @zone = zone
    @details = [station_name, zone]
  end 


end