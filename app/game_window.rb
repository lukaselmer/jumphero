require 'gosu'
require_relative 'helpers/media.rb'
require_relative 'game'

class GameWindow < Gosu::Window
  def initialize(width=1024, height=768, fullscreen=false)
    super
    self.caption = 'Jump Hero'
    @background = Gosu::Image.new(self, Media.path('background.png'), tileable: true)
    # @message = Gosu::Image.from_text(self, 'Hello, World!', Gosu.default_font_name, 30)
    @player = Gosu::Image.new(self, Media.path('player/preview/run.gif'), false)
    @game = Game.new
  end

  def draw
    draw_background
    # @message.draw(10, 10, 0)
    @player.draw(10, 570 - @game.jumping_height, 0, scale_x=0.2, scale_y=0.2)
  end

  def draw_background
    scale = height.to_f / @background.height
    scaled_width = @background.width * scale
    x_spot = (-Gosu.milliseconds.to_f / 4) % scaled_width
    @background.draw(-scaled_width + x_spot, 0, 0, scale_x=scale, scale_y=scale)
    @background.draw(x_spot, 0, 0, scale_x=scale, scale_y=scale)
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
end
