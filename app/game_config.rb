class GameConfig
  # The jump duration in milliseconds
  attr_accessor :jump_duration
  # The maximum jump height
  attr_accessor :jump_height

  def initialize
    self.jump_duration = 1500
    self.jump_height = 300
  end
end
