require_relative 'helpers/gosu_helper'
require_relative 'game_config'
require_relative 'game_time'
require_relative 'logic/jumping_behavior'
require_relative 'game/score'


class Game
  def initialize(game_config = GameConfig.new, game_time = GameTime.new(GosuHelper.m))
    @config = game_config
    @game_time = game_time
    @jumping_behavior = JumpingBehavior.new(@config, @game_time)
    @score = Score.new(@game_time)
  end

  def update(milliseconds = nil)
    @game_time.m = milliseconds || GosuHelper.m
    @jumping_behavior.update
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
