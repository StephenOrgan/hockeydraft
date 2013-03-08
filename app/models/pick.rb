class Pick < ActiveRecord::Base
  attr_accessible :player_id, :team_id, :user_id

  belongs_to :teams
end
