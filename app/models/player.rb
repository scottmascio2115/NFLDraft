class Player < ActiveRecord::Base
  belongs_to :team
  validates_uniqueness_of :name
  validates_uniqueness_of :taken_number, :allow_blank => true, :allow_nil => true

  def self.available
    where("taken_number IS ?", nil).order("position")
  end

  def self.last_three_taken
    where.not(pick_id: nil).order("taken_number DESC").limit(3)
  end

  def self.last_taken
    where.not(pick_id: nil).order("taken_number DESC").limit(1).first
  end
end
