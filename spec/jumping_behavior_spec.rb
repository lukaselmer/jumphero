require_relative '../app/logic/jumping_behavior'
require_relative '../app/game_time'


RSpec.describe JumpingBehavior do
  def update_with_time(m)
    @time.m = m
    @jumping_behavior.update
  end

  before(:each) do
    @config = GameConfig.new
    @config.jump_duration = 15
    @time = GameTime.new(0)

    @jumping_behavior = JumpingBehavior.new(@config, @time)
  end

  describe 'jumping' do
    it 'is not jumping at the start of the game' do
      expect(@jumping_behavior.jumping?).to be_falsey
    end

    it 'is jumping when start_jump was called' do
      @jumping_behavior.jump
      expect(@jumping_behavior.jumping?).to be_truthy
    end

    it 'should stop jumping after 15 frames' do
      update_with_time(20)
      expect(@jumping_behavior.jumping?).to be_falsey
      @jumping_behavior.jump
      expect(@jumping_behavior.jumping?).to be_truthy
      update_with_time(21)
      expect(@jumping_behavior.jumping?).to be_truthy
      update_with_time(34)
      expect(@jumping_behavior.jumping?).to be_truthy
      update_with_time(35)
      expect(@jumping_behavior.jumping?).to be_falsey
      update_with_time(300)
      expect(@jumping_behavior.jumping?).to be_falsey
    end

    it 'should stay jumping when updated multiple times' do
      update_with_time(20)
      expect(@jumping_behavior.jumping?).to be_falsey
      @jumping_behavior.jump
      expect(@jumping_behavior.jumping?).to be_truthy
      update_with_time(20)
      expect(@jumping_behavior.jumping?).to be_truthy
    end

    it 'should implement the jump completion rate' do
      @config.jump_duration = 100
      update_with_time(0)
      @jumping_behavior.jump
      expect(@jumping_behavior.jumping_completion_rate).to be_within(0.001).of(0.0)
      update_with_time(20)
      expect(@jumping_behavior.jumping_completion_rate).to be_within(0.001).of(0.2)
      update_with_time(70)
      expect(@jumping_behavior.jumping_completion_rate).to be_within(0.001).of(0.7)
      update_with_time(99)
      expect(@jumping_behavior.jumping_completion_rate).to be_within(0.001).of(0.99)
      update_with_time(100)
      expect(@jumping_behavior.jumping_completion_rate).to be_within(0.001).of(1.0)
      update_with_time(110)
      expect(@jumping_behavior.jumping_completion_rate).to be_within(0.001).of(1.0)
    end
  end
end
