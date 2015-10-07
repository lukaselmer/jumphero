require 'ostruct'
require_relative '../app/game/collision_checker'
require_relative '../app/helpers/gosu_helper'

RSpec.describe CollisionChecker do
  before(:each) do
    @collision_checker = CollisionChecker.new(100.0, 200.0, 1000)
  end

  describe '#check_collision' do
    it 'does not collide when jumping high enough' do
      o = double(height: 300, relative_position: 0.9)
      expect(@collision_checker.colliding?(double(jumping_height: 400), o)).to be_falsey
      o = double(height: 300, relative_position: 0.301)
      expect(@collision_checker.colliding?(double(jumping_height: 400), o)).to be_falsey
      o = double(height: 300, relative_position: 0.299)
      expect(@collision_checker.colliding?(double(jumping_height: 400), o)).to be_falsey
      o = double(height: 300, relative_position: 0.2)
      expect(@collision_checker.colliding?(double(jumping_height: 400), o)).to be_falsey
      o = double(height: 300, relative_position: 0.1)
      expect(@collision_checker.colliding?(double(jumping_height: 400), o)).to be_falsey
      o = double(height: 300, relative_position: 0.0)
      expect(@collision_checker.colliding?(double(jumping_height: 400), o)).to be_falsey
    end

    it 'does collide when not jumping' do
      o = double(height: 300, width: 100, relative_position: 0.9)
      expect(@collision_checker.colliding?(double(jumping_height: 0), o)).to be_falsey
      o = double(height: 300, width: 100, relative_position: 0.301)
      expect(@collision_checker.colliding?(double(jumping_height: 0), o)).to be_falsey
      o = double(height: 300, width: 100, relative_position: 0.299)
      expect(@collision_checker.colliding?(double(jumping_height: 0), o)).to be_truthy
      o = double(height: 300, width: 100, relative_position: 0.201)
      expect(@collision_checker.colliding?(double(jumping_height: 0), o)).to be_truthy
      o = double(height: 300, width: 100, relative_position: 0.199)
      expect(@collision_checker.colliding?(double(jumping_height: 0), o)).to be_falsey
    end
  end
end
