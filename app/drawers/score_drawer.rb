class ScoreDrawer
  def initialize(game)
    @game = game
    @score = Gosu::Font.new(30)
  end

  def draw(window_width, window_height)
    text = "#{@game.meters.round(1)}m"
    @score.draw(text, window_width - 30 - @score.text_width(text), window_height - 50, 20, 1.0, 1.0, 0xff_f0ffff)
  end
end
