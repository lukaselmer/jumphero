require_relative '../app/game/obstacle'
require_relative '../app/helpers/gosu_helper'

RSpec.describe Score do
  before(:each) do
    @game_time = GameTime.new(327)
    @obstacle = Obstacle.new(@game_time, 130, 3000)
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

  describe '#relative_position' do
    it 'is moves from left to right' do
      expect(@obstacle.relative_position).to be_within(0.001).of(1.0)
      @game_time.m = 1327
      expect(@obstacle.relative_position).to be_within(0.01).of(0.6666)
      @game_time.m = 2327
      expect(@obstacle.relative_position).to be_within(0.01).of(0.3333)
      @game_time.m = 3327
      expect(@obstacle.relative_position).to be_within(0.01).of(0.0)
      @game_time.m = 4327
      expect(@obstacle.relative_position).to be_within(0.01).of(-0.3333)
    end
  end
end
