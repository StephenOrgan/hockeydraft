class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :team_id
      t.string :integer

      t.timestamps
    end
  end
end
