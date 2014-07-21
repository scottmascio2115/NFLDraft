class Pick < ActiveRecord::Base
  belongs_to :team
  has_one :player

  def self.last_three
    Player.last_three_taken
  end

  def self.next_pick
    last_player_picked = Player.last_taken
    self.find_by_id(last_player_picked.pick_id += 1) if last_player_picked
  end

  def self.draft_over
    last_pick = Player.last_taken
    last_pick.taken_number >= self.count if last_pick
  end
end
