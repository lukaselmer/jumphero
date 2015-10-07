class ObstacleFactory
  attr_accessor :obstacles

  def initialize(game_time)
    @game_time = game_time
    reset
  end

  def reset
    @start_time = @game_time.s
    @obstacles = []
    @generated_obstacles = 0
  end

  def update
    if must_generate_obstacle?
      @obstacles << Obstacle.new(@game_time, 100, 3000)
      @generated_obstacles += 1
    end
  end

  private

  def time_since_start
    @game_time.s - @start_time
  end

  def must_generate_obstacle?
    @generated_obstacles == 0 && time_since_start >= 0.1 ||
      @generated_obstacles == 1 && time_since_start >= 2.1
  end
end
