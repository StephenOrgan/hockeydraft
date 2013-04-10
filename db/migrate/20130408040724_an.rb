class An < ActiveRecord::Migration
  def change
	remove_column :teams, :draftdirectionr, :string
  end
end
