require 'gosu'
require_relative 'helpers/media'
require_relative 'game'
require_relative 'drawers/player_drawer'
require_relative 'drawers/background_drawer'
require_relative 'drawers/score_drawer'

class GameWindow < Gosu::Window
  def initialize(width=1024, height=768, fullscreen=false)
    super
    self.caption = 'Jump Hero'
    @game = Game.new
    @player_drawer = PlayerDrawer.new(self, @game)
    @background_drawer = BackgroundDrawer.new(self)
    @jumping_sound = GosuHelper.load_sample('jump/jump-1.m4a')
    @score_drawer = ScoreDrawer.new(@game)
  end

  def draw
    @background_drawer.draw
    @player_drawer.draw
    @score_drawer.draw(width, height)
  end

  def update
    check_exit

    if button_down? Gosu::KbUp
      @jumping_sound.play if @game.jump
    end

    @game.reset if button_down? Gosu::KbR

    @game.update
  end

  private
  def check_exit
    close if button_down? Gosu::KbEscape
  end
end
