class Score
  # @param [GameTime] game_time
  def initialize(game_time)
    @game_time = game_time
    @start_time = @game_time.s
  end

  def reset
    @start_time = @game_time.s
  end

  def meters
    # the approx max human running speed, see https://en.wikipedia.org/wiki/Footspeed#Limits_of_speed
    max_human_mps = 12.4
    max_human_mps * (@game_time.s - @start_time)
  end
end
