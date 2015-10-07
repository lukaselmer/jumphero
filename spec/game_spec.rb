require_relative '../app/game'
require_relative '../app/helpers/gosu_helper'

RSpec.describe Game do
  before(:each) do
    game_time = GameTime.new
    @game_config = GameConfig.new
    @game_config.jump_duration = 1500
    @obstacle_factory = ObstacleFactory.new(@game_config, game_time)
    @game = Game.new(@game_config, game_time, @obstacle_factory)
  end

  describe 'jumping' do
    it 'is not jumping at the start of the game' do
      expect(@game.jumping?).to be_falsey
    end

    it 'is jumping when start_jump was called' do
      @game.jump
      expect(@game.jumping?).to be_truthy
    end

    it 'should stop jumping after 1500 milliseconds' do
      @game.update(200)
      expect(@game.jumping?).to be_falsey
      @game.jump
      expect(@game.jumping?).to be_truthy
      @game.update(201)
      expect(@game.jumping?).to be_truthy
      @game.update(1699)
      expect(@game.jumping?).to be_truthy
      @game.update(1700)
      expect(@game.jumping?).to be_falsey
    end
  end

  describe '#reset' do
    it 'resets the score' do
      @game.update(1000)
      expect(@game.meters).to be_between(10, 1000)
      @game.reset
      expect(@game.meters).to eq(0)
    end

    it 'resets the obstacle factory' do
      expect(@game.obstacles.length).to eq(0)
      @game.update(200)
      expect(@game.obstacles.length).to eq(1)
      @game.reset
      expect(@game.obstacles.length).to eq(0)
    end
  end
end
