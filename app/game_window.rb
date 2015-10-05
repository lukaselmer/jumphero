require 'gosu'
require_relative 'helpers/media.rb'
require_relative 'game'

class GameWindow < Gosu::Window
  def initialize(width=1024, height=768, fullscreen=false)
    super
    self.caption = 'Jump Hero'
    @background = Gosu::Image.new(self, Media.path('background.png'), false)
    # @message = Gosu::Image.from_text(self, 'Hello, World!', Gosu.default_font_name, 30)
    @player = Gosu::Image.new(self, Media.path('player/preview/run.gif'), false)
    @game = Game.new
  end

  def draw
    scale = height.to_f / @background.height
    @background.draw(0, 0, 0, scale_x=scale, scale_y=scale)
    # @message.draw(10, 10, 0)
    @player.draw(10, 570 - @game.jumping_height, 0, scale_x=0.2, scale_y=0.2)
  end

  def update
    @game.jump if button_down?(Gosu::KbUp)
    @game.update
  end
end
