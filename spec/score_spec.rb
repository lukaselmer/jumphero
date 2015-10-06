require_relative '../app/game/score'
require_relative '../app/helpers/gosu_helper'

RSpec.describe Score do
  before(:each) do
    @game_time = GameTime.new(0)
    @score = Score.new(@game_time)
  end

  describe 'calculating the score' do
    it 'scores 0 meters after 0 milliseconds' do
      expect(@score.meters).to eq(0)
    end

    it 'scores 12.4 meters after 1 second' do
      @game_time.m = 1000
      expect(@score.meters).to be_within(0.001).of(12.4)
    end

    it 'scores 434 meters after 35 second' do
      @game_time.m = 35_000
      expect(@score.meters).to be_within(0.001).of(434)
    end

  end

  describe 'reset' do
    it 'scores 0 meters when the score is reset' do
      @game_time.m = 30_000
      @score.reset
      expect(@score.meters).to eq(0)
    end

    it 'scores 434 meters after 65 seconds when the score is reset after 30 seconds' do
      @game_time.m = 30_000
      @score.reset
      @game_time.m = 65_000
      expect(@score.meters).to be_within(0.001).of(434)
    end
  end
end
