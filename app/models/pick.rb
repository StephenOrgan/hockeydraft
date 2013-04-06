class Pick < ActiveRecord::Base
  attr_accessible :player_id, :team_id, :user_id, :league_id
  
  belongs_to :player
  belongs_to :team
  belongs_to :league

	validates :team, presence: true
	validates :league, presence: true
	validates :player, presence: true
end


#, scope: [:league_id]
