class PlayerDrawer
  # @param [GameWindow] window
  # @param [Game] game
  def initialize(window, game)
    @game = game
    @running_animation = (1..5).map { |i| GosuHelper.load_image("player/transparent/run/frame-#{i}.png") }
    @jump_up = GosuHelper.load_image('player/transparent/jump/jump-up.png')
    @jump_down = GosuHelper.load_image('player/transparent/jump/jump-down.png')
  end

  def draw
    player = current_animation
    player.draw(10, 577 - @game.jumping_height, 0, scale_x=0.2, scale_y=0.2)
  end

  private

  def current_animation
    return @running_animation[running_frame] unless @game.jumping?

    @game.jumping_up? ? @jump_up : @jump_down
  end

  def running_frame
    (GosuHelper.m.to_f / 75).round % @running_animation.length
  end

end
