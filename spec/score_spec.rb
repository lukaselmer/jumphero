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
  end
end
