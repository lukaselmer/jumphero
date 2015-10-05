# Handles the jumping logic
class JumpingBehavior
  # @param [GameConfig] config
  # @param [GameTime] game_time
  def initialize(config, game_time)
    @config = config
    @game_time = game_time
  end

  def update
    update_jumping
  end

  def jumping?
    @jumping
  end

  def jump
    return if jumping?
    @jumping_start = @game_time.m
    @jumping = true
  end

  def jumping_completion_rate
    return 1.0 unless jumping?

    time_jumping = @game_time.m - @jumping_start
    1.0 / @config.jump_duration * time_jumping
  end

  def jumping_height
    Math.sin(jumping_completion_rate * Math::PI) * @config.jump_height
  end

  private
  def update_jumping
    return unless jumping?

    @jumping = @jumping_start + @config.jump_duration > @game_time.m
  end
end
