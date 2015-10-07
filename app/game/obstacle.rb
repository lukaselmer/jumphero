class Obstacle
  # @return [Fixnum]
  attr_accessor :height
  # @return [Fixnum]
  attr_accessor :start_m

  # @param [GameTime] game_time
  # @param [Fixnum] height
  def initialize(game_time, height, duration_to_reach_left_side)
    @game_time = game_time
    self.height = height
    self.start_m = @game_time.m
    @duration_to_reach_left_side = duration_to_reach_left_side
  end

  def relative_position
    duration_until_now = @game_time.m - start_m
    1.0 - (duration_until_now.to_f / @duration_to_reach_left_side)
  end

  def passed_by?
    relative_position < -0.5
  end
end
