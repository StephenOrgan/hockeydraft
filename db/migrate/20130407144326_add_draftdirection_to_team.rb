class AddDraftdirectionToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :draftdirectionr, :string
  end
end