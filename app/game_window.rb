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
  end

  def draw
    @background_drawer.draw
    @player_drawer.draw(@game.jumping_height)
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
    # TODO: implement score: @message = Gosu::Image.from_text(self, 'Hello, World!', Gosu.default_font_name,
    # 30); @message.draw(10, 10, 0)
  end
end
