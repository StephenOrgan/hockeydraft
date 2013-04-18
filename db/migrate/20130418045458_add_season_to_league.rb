class AddSeasonToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :season, :string
  end
end
