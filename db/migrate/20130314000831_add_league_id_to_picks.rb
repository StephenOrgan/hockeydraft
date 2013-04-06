class AddLeagueIdToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :league_id, :integer
  end
end
