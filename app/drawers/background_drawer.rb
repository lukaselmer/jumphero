class BackgroundDrawer
  def initialize(window)
    @window = window
    @background = Gosu::Image.new(@window, Media.path('background.png'), tileable: true)
  end

  def draw
    scale = @window.height.to_f / @background.height
    scaled_width = @background.width * scale
    x_spot = (-GosuHelper.m.to_f / 4) % scaled_width
    @background.draw(-scaled_width + x_spot, 0, 0, scale, scale)
    @background.draw(x_spot, 0, 0, scale, scale)
  end
end
