require 'spec_helper'

describe Pick do
  before do
    @scott = Player.create!(name: 'Scott', pick_id: 256, taken_number: 256)
    @brooke = Player.create!(name: 'brooke', pick_id: 257, taken_number: 257)
    @tony = Player.create!(name: 'Tony', pick_id: 258, taken_number: 258)
    @pick = Pick.create!(id: 259)
  end

  describe ".last_three" do
    it "should return last three players picked" do

      expect(Pick.last_three).to include(@scott, @brooke, @tony)
    end
  end

  describe ".next_pick" do
    it "should return the next pick" do

      expect(Pick.next_pick).to eql(@pick)
    end
  end

  describe ".draft_over" do
    it "should return true or false if draft is over" do

      expect(Pick.draft_over).to eql(true)
    end
  end
end
