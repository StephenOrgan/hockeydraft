class AddStatusToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :status, :string
  end
end
