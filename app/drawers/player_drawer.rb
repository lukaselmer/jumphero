class PlayerDrawer
  def initialize(window)
    @player = Gosu::Image.new(window, Media.path('player/preview/run.gif'), false)
  end

  def draw(jumping_height)
    @player.draw(10, 570 - jumping_height, 0, scale_x=0.2, scale_y=0.2)
  end
end
