class ObstacleDrawer
  def initialize(window, game)
    @window = window
    @game = game
    @background = Gosu::Image.new(@window, Media.path('obstacles/stone-texture.jpg'), tileable: true)
  end

  def draw
    @game.obstacles.each do |o|
      y = GosuHelper.floor_y - o.height
      scale = o.height.to_f / @background.height

      @background.draw(@window.width * o.relative_position, y, 100, scale, scale)
    end
  end
end
