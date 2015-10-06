class Obstacle
  # @return [Fixnum]
  attr_accessor :height
  # @return [Fixnum]
  attr_accessor :start_m

  # @param [GameTime] game_time
  # @param [Fixnum] height
  def initialize(game_time, height)
    self.height = height
    self.start_m = game_time.m
  end
end
