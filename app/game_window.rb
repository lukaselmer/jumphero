require 'gosu'
require_relative 'helpers/media.rb'


class GameWindow < Gosu::Window
  def initialize(width=1024, height=768, fullscreen=false)
    super
    self.caption = 'Jump Hero'
    @background = Gosu::Image.new(self, Media.path('background.png'), false)
    @message = Gosu::Image.from_text(self, 'Hello, World!', Gosu.default_font_name, 30)
  end

  def draw
    scale = height.to_f / @background.height
    @background.draw(0, 0, 0, scale_x=scale, scale_y=scale)
    @message.draw(10, 10, 0)
  end
end
