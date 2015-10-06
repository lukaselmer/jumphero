class ObstacleDrawer
  def initialize(window, game)
    @window = window
    @game = game
  end

  def draw
    @game.obstacles.each do |o|
      font = Gosu::Font.new(o.height)
      font.draw('||', @window.width * o.relative_position, 567, 100, 1, 1, 0xff_ff0000)
    end
  end
end
