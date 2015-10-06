class GameTime
  attr_accessor :m

  def initialize(milliseconds)
    self.m = milliseconds
  end

  def s
    m.to_f / 1000
  end
end
