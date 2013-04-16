class AddLrDefensemenToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :lr_defensemen, :integer
  end
end
