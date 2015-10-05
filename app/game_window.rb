require 'gosu'
require_relative 'helpers/media.rb'
require_relative 'game'
require_relative 'drawers/player_drawer.rb'

class GameWindow < Gosu::Window
  def initialize(width=1024, height=768, fullscreen=false)
    super
    self.caption = 'Jump Hero'
    @background = Gosu::Image.new(self, Media.path('background.png'), tileable: true)
    @game = Game.new
    @player_drawer = PlayerDrawer.new(self)
  end

  def draw
    draw_background
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

  def draw_background
    scale = height.to_f / @background.height
    scaled_width = @background.width * scale
    x_spot = (-Gosu.milliseconds.to_f / 4) % scaled_width
    @background.draw(-scaled_width + x_spot, 0, 0, scale_x=scale, scale_y=scale)
    @background.draw(x_spot, 0, 0, scale_x=scale, scale_y=scale)
  end

  def draw_score
    # TODO: implement score: @message = Gosu::Image.from_text(self, 'Hello, World!', Gosu.default_font_name,
    # 30); @message.draw(10, 10, 0)
  end
end
