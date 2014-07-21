class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :round
      t.integer :pick
      t.string :team_name
      t.integer :team_id

      t.timestamps
    end
  end
end
