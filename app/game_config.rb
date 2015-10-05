class GameConfig
  # @return [Fixnum] the jump duration in milliseconds
  attr_accessor :jump_duration
  # @return [Fixnum] the maximum jump height
  attr_accessor :jump_height

  def initialize
    self.jump_duration = 1100
    self.jump_height = 200
  end
end
