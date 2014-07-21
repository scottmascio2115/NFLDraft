require 'spec_helper'

describe Player do
  before do
    @scott = Player.create!(name: 'Scott', pick_id: 256, taken_number: 256)
    @brooke = Player.create!(name: 'brooke', pick_id: 257, taken_number: 257)
    @tony = Player.create!(name: 'Tony', pick_id: 258)
  end

  describe ".last_three_taken" do
    it "should return last three players picked" do

      expect(Player.last_three_taken).to include(@scott, @brooke, @tony)
    end
  end

  describe ".last_taken" do
    it "should return last player picked" do

      expect(Player.last_taken).to eql(@tony)
    end
  end
end
