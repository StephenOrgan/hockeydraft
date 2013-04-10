class AddDirectionToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :direction, :string
  end
end
