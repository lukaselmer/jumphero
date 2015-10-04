class Game
  def initialize
  end

  def frames=(frames)
    @frames = frames
    update_jumping
  end

  def jumping?
    @jumping
  end

  def jump
    @jumping_start = @frames
    @jumping = true
  end

  private
  def update_jumping
    return unless jumping?

    @jumping = @jumping_start + 15 > @frames
  end
end
