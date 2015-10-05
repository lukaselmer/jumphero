class PlayerDrawer
  def initialize(window)
    @running_animation = (1..5).map { |i| GosuHelper.load_image(window, "player/transparent/run/frame-#{i}.png") }
    @jump_up = GosuHelper.load_image(window, 'player/transparent/jump/jump-up.png')
    @jump_down = GosuHelper.load_image(window, 'player/transparent/jump/jump-down.png')
  end

  def draw(jumping_height)
    player = @running_animation[(GosuHelper.m.to_f / 75).round % @running_animation.length]
    player.draw(10, 577 - jumping_height, 0, scale_x=0.2, scale_y=0.2)
  end
end
