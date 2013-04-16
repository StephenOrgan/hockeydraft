class AddLrGoaliesToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :lr_goalies, :integer
  end
end
