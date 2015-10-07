class CollisionChecker
  # @param [Fixnum] character_width
  # @param [Fixnum] character_start
  # @param [Fixnum] window_width
  def initialize(character_start = 10.0, character_width = 61.4, window_width = 1024)
    @relative_character_start = character_start / window_width
    @relative_character_end = @relative_character_start + character_width / window_width
    @window_width = window_width
  end

  # @param [JumpingBehavior] jumping_behavior
  # @param [Obstacle] obstacle
  def colliding?(jumping_behavior, obstacle)
    # obstacle is below the character
    return false if jumping_behavior.jumping_height >= obstacle.height

    # obstacle is in front of the character
    obstacle_left = obstacle.relative_position
    return false if @relative_character_end <= obstacle_left

    # obstacle is behind the character
    obstacle_right = obstacle.relative_position + obstacle.width.to_f / @window_width
    return false if @relative_character_end >= obstacle_right

    # since the character cannot be below the obstacle, they must be colliding
    true
  end
end
