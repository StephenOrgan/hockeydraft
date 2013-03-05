class AddDraftorderToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :draftrank, :integer
  end
end
