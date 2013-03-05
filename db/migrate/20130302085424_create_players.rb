class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :player_id
      t.integer :goals
      t.integer :assists
      t.integer :points
      t.string :position
      t.string :string
      t.integer :shutouts
      t.integer :wins

      t.timestamps
    end
  end
end
