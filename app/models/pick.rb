class Pick < ActiveRecord::Base
  attr_accessible :player_id, :team_id, :user_id, :league_id
  
  belongs_to :player
  belongs_to :team
  belongs_to :league

	validates :team, presence: true
	validates :league, presence: true
	validates :player, presence: true



	after_save :after_pick_created

	# def taken_for?(player, league_id)
	# 	  players.find do |p| 
 #    	p.league_id == league_id
 #    end
 #  end

	def after_pick_created
		teams = Team.where(:league_id => league_id)
		nextteamup = teams.where(:draftrank => team.draftrank - 1)
		nextteamdown = teams.where(:draftrank => team.draftrank + 1)
<<<<<<< HEAD
		leagueteams = league.teams.count
		leaguemax = leagueteams * (league.lr_forwards + league.lr_defensemen + league.lr_goalies)
		leaguepicks = league.picks.count


		if leaguepicks == leaguemax 
		league.end_draft
=======
		countteams = Team.where(:league_id => league.id).count
		countpicks = league.picks.count
		leaguemax = (league.lr_forwards + league.lr_defensemen + league.lr_goalies) * countteams

		if (countpicks == leaguemax)
		league.update_attributes(:status => 'draft_completed')
>>>>>>> 62e75a324a04e00e30a51230deab0118588f897b
		end

		if (team.direction == 'down')
			if nextteamdown.blank?
				 team.update_attributes(:direction => 'up')
				 Pusher['private-'+league_id.to_s].trigger('new_message', {:from => 'league_name', :subject => team.name + 'has selected ' + player.name + '. ' + team.name + ' gets to select again'})
			else
				if nextteamdown.first.draftrank > 0
					team.update_attributes(:status => 'not_ready_to_pick')
					nextteamdown.first.update_attributes(:direction =>'down')
					nextteamdown.first.update_attributes(:status => 'ready_to_pick')
					Pusher['private-'+league_id.to_s].trigger('new_message', {:from => 'league_name', :subject => team.name + 'has selected ' + player.name + '. ' + nextteamdown.first.name + ' is next up'})
				end
			end
		else
			if (team.direction == 'up')
				if nextteamup.blank?
					team.update_attributes(:direction =>'down')
					Pusher['private-'+league_id.to_s].trigger('new_message', {:from => 'league_name', :subject => team.name + 'has selected ' + player.name + '. ' + team.name + ' gets to select again'})
				else
					if nextteamup.first.draftrank > 0
							team.update_attributes(:status => 'not_ready_to_pick')
							nextteamup.first.update_attributes(:direction => 'up')
							nextteamup.first.update_attributes(:status => 'ready_to_pick')
							Pusher['private-'+league_id.to_s].trigger('new_message', {:from => 'league_name', :subject => team.name + 'has selected ' + player.name + '. ' + nextteamup.first.name + ' is next up'})
					end
				end
			end
		end
	end
end


#, scope: [:league_id]
