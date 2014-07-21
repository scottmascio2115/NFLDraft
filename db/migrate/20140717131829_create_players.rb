class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :taken_number
      t.integer :team_id
      t.integer :pick_id

      t.timestamps
    end
  end
end
