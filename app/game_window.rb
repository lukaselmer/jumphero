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
    @player_drawer = PlayerDrawer.new(self, @game)
    @background_drawer = BackgroundDrawer.new(self)
    @score = Gosu::Font.new(30)
    @jumping_sound = GosuHelper.load_sample('jump/jump-1.m4a')
  end

  def draw
    @background_drawer.draw
    @player_drawer.draw
    draw_score
  end

  def update
    check_exit

    if button_down? Gosu::KbUp
      @jumping_sound.play if @game.jump
    end

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
    @score.draw(text, width - 30 - @score.text_width(text), height - 50, 20, 1.0, 1.0, 0xff_f0ffff)
  end
end
