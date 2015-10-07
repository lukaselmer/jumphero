class GameConfig
  # @return [Fixnum] the jump duration in milliseconds
  attr_accessor :jump_duration
  # @return [Fixnum] the maximum jump height
  attr_accessor :jump_height
  # @return [Fixnum] the time which is needed for objects to pass from right to left
  attr_accessor :time_screen_shift

  def initialize
    self.jump_duration = 1100
    self.jump_height = 200
    self.time_screen_shift = 3000
  end
end
