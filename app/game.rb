require_relative 'helpers/gosu_helper'
require_relative 'game_config'
require_relative 'game_time'
require_relative 'logic/jumping_behavior'
require_relative 'game/score'
require_relative 'game/obstacle'
require_relative 'game/obstacle_factory'

class Game
  attr_reader :obstacles

  def initialize(game_config = GameConfig.new, game_time = GameTime.new(GosuHelper.m),
                 obstacle_factory = ObstacleFactory.new(game_time))
    @config = game_config
    @game_time = game_time
    @jumping_behavior = JumpingBehavior.new(@config, @game_time)
    @score = Score.new(@game_time)
    @obstacles = [Obstacle.new(game_time, 100, 3000)]
  end

  def update(milliseconds = nil)
    @game_time.m = milliseconds || GosuHelper.m
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
    @score.reset
  end
end
