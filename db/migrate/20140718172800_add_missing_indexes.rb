class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :players, :team_id
    add_index :picks, :team_id
  end
end
