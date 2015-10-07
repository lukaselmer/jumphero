require_relative 'helpers/gosu_helper'
require_relative 'game_config'
require_relative 'game_time'
require_relative 'logic/jumping_behavior'
require_relative 'game/score'
require_relative 'game/obstacle'
require_relative 'game/obstacle_factory'
require_relative 'game/collision_checker'

class Game
  def initialize(dimensions, game_config = GameConfig.new, game_time = GameTime.new(GosuHelper.m),
                 obstacle_factory = ObstacleFactory.new(game_config, game_time))
    @config = game_config
    @game_time = game_time
    @obstacle_factory = obstacle_factory
    @jumping_behavior = JumpingBehavior.new(@config, @game_time)
    @score = Score.new(@game_time)
    @collision_checker = CollisionChecker.new(
      dimensions[:character_start], dimensions[:character_width], dimensions[:window_width])
    @game_over = false
  end

  def game_over?
    @game_over
  end

  def obstacles
    @obstacle_factory.obstacles
  end

  def update(milliseconds = nil)
    @game_time.m = milliseconds || GosuHelper.m
    @obstacle_factory.update
    check_collisions
  end

  def jumping?
    @jumping_behavior.jumping?
  end

  def jumping_up?
    @jumping_behavior.jumping_up?
  end

  def jump
    @jumping_behavior.jump
  end

  def jumping_height
    @jumping_behavior.jumping_height
  end

  def meters
    @score.meters
  end

  def reset
    @obstacle_factory.reset
    @score.reset
    @game_over = false
  end

  private

  def check_collisions
    return if @game_over

    if obstacles.any? { |o| @collision_checker.colliding?(@jumping_behavior, o) }
      @game_over = true
      @final_meters = @score.meters
    end
  end
end
