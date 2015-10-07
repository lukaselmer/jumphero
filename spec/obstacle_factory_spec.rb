require_relative '../app/game/obstacle_factory'
require_relative '../app/helpers/gosu_helper'

RSpec.describe ObstacleFactory do
  before(:each) do
    @game_time = GameTime.new(0)
    @obstacle_factory = ObstacleFactory.new(@game_time)
  end

  describe '#obstacles' do
    it 'returns no obstacles in the beginning' do
      expect(@obstacle_factory.obstacles).to eq([])
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles).to eq([])
    end

    it 'generates one obstacle after 100ms' do
      expect(@obstacle_factory.obstacles).to eq([])
      @game_time.m = 99
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(0)
      @game_time.m = 100
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(1)
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(1)
    end

    it 'generates one obstacle after 1500ms' do
      expect(@obstacle_factory.obstacles).to eq([])
      @game_time.m = 100
      @obstacle_factory.update
      @game_time.m = 2100
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(2)
    end
  end

  describe '#reset' do
    it 'resets the obstacles' do
      @game_time.m = 100
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(1)
      @obstacle_factory.reset
      expect(@obstacle_factory.obstacles).to eq([])
      @game_time.m = 199
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles).to eq([])
      @game_time.m = 200
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(1)
    end
  end
end
