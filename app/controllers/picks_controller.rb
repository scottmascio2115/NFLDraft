class PicksController < ApplicationController
  def index
    @picks = Pick.all
    @available_players = Player.available
    @last_three_picks = Pick.last_three
    @next_pick = Pick.next_pick
    @draft_over = Pick.draft_over
  end
end
