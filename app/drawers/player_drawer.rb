class PlayerDrawer
  def initialize(window)
    @player = (1..5).map do |i|
      Gosu::Image.new(window, Media.path("player/transparent/run/frame-#{i}.png"), false)
    end
  end

  def draw(jumping_height)
    player = @player[(GosuHelper.m.to_f / 75).round % @player.length]
    player.draw(10, 577 - jumping_height, 0, scale_x=0.2, scale_y=0.2)
  end
end
