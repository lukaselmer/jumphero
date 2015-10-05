class GameConfig
  # The jump duration in milliseconds
  attr_accessor :jump_duration

  def initialize
    @jump_duration = 1500
  end
end
