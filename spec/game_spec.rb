require_relative '../app/game'

RSpec.describe Game do
  before(:example) do
    @game = Game.new
  end

  describe 'jumping' do
    it 'is not jumping at the start of the game' do
      expect(@game.jumping?).to be_falsey
    end

    it 'is jumping when start_jump was called' do
      @game.jump
      expect(@game.jumping?).to be_truthy
    end

    it 'should stop jumping after 15 frames' do
      @game.frames = 20
      expect(@game.jumping?).to be_falsey
      @game.jump
      expect(@game.jumping?).to be_truthy
      @game.frames = 21
      expect(@game.jumping?).to be_truthy
      @game.frames = 35
      expect(@game.jumping?).to be_falsey
      @game.frames = 36
    end
  end
end
