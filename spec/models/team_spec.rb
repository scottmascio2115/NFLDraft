require 'spec_helper'

describe Team do
  before do
    @player = Player.create!(name: 'Devin Hester')
    @bears = Team.create!(name: "Da Bears")
  end

  describe "acquire(player)" do
    it "should add a player to a team" do
      @bears.acquire(@player)

      expect(@bears.players).to include(@player)
    end
  end
end
