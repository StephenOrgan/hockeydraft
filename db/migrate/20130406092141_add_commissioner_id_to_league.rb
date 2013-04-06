class AddCommissionerIdToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :commissioner_id, :integer
  end
end
