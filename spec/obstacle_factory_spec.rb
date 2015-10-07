require_relative '../app/game/obstacle_factory'
require_relative '../app/helpers/gosu_helper'

RSpec.describe ObstacleFactory do
  before(:each) do
    @game_time = GameTime.new(0)
    game_config = GameConfig.new
    game_config.time_screen_shift = 5000
    @obstacle_factory = ObstacleFactory.new(game_config, @game_time)
  end

  describe '#update and #obstacles' do
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

    it 'destroys all obstacles which have passed by' do
      expect(@obstacle_factory.obstacles).to eq([])
      @game_time.m = 100
      @obstacle_factory.update
      @game_time.m = 2100
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(2)
      @game_time.m = 7600
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(2)
      @game_time.m = 7601
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(1)
      @game_time.m = 9600
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(1)
      @game_time.m = 9601
      @obstacle_factory.update
      expect(@obstacle_factory.obstacles.length).to eq(0)
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
