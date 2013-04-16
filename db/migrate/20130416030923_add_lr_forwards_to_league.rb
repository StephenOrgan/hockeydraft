class AddLrForwardsToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :lr_forwards, :integer
  end
end
