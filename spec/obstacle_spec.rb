require_relative '../app/game/obstacle'
require_relative '../app/helpers/gosu_helper'

RSpec.describe Score do
  before(:each) do
    @game_time = GameTime.new(327)
    @obstacle = Obstacle.new(@game_time, 130)
  end

  describe '#height' do
    it 'stores the height of the obstacle' do
      expect(@obstacle.height).to eq(130)
    end
  end

  describe '#start_m' do
    it 'stores the start game time' do
      expect(@obstacle.start_m).to eq(327)
      @game_time.m = 400
      expect(@obstacle.start_m).to eq(327)
    end
  end
end
