class Team < ActiveRecord::Base
  has_many :picks
  has_many :players

  def self.consistent_name
    jets = self.find_by(name: "New York Jets  ")
    giants = self.find_by(name: "New York Giants  ")
    giants.update_attribute(:name, "NY Giants") if giants
    jets.update_attribute(:name, "NY Jets") if jets
  end

  def acquire(player)
    self.players << player
    self.save!
  end
end
