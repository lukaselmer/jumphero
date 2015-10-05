require 'gosu'
require_relative 'helpers/media'
require_relative 'game'
require_relative 'drawers/player_drawer'
require_relative 'drawers/background_drawer'

class GameWindow < Gosu::Window
  def initialize(width=1024, height=768, fullscreen=false)
    super
    self.caption = 'Jump Hero'
    @game = Game.new
    @player_drawer = PlayerDrawer.new(self)
    @background_drawer = BackgroundDrawer.new(self)
    @score = Gosu::Font.new(30)
  end

  def draw
    @background_drawer.draw
    @player_drawer.draw(@game.jumping_height)
    draw_score
  end

  def update
    check_exit
    @game.jump if button_down? Gosu::KbUp
    @game.update
  end

  private
  def check_exit
    close if button_down? Gosu::KbEscape
  end

  def draw_score
    meters_per_second = 3.61
    meters_ran = (GosuHelper.m.to_f / 1000 * meters_per_second).round(1)
    text = "#{meters_ran}m"
    @score.draw("#{meters_ran}m", width - 30 - @score.text_width("#{meters_ran}m"), height - 50, 20, 1.0, 1.0, 0xff_f0ffff)
  end
end
