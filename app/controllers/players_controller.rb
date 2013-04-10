class PlayersController < ApplicationController

	
	def index
		@league = League.find(params[:league_id])
		@team = Team.find(params[:team_id])
		@takenpicks = Pick.where(:league_id=> @league)
		@pick = Pick.new league_id: params[:league_id]
		@picks = Pick.where(league_id: params[:league_id])
		@taken = 'NOT AVAILABLE'
		#Pick.find(:all, :conditions => { :league_id => params[:league_id] })
		#@takenteam = 
		#@playerpicks = Player.where(:id == Pick.player_id)


    if params[:position]=='all'
    	@players = Player.where("position = 'C' OR position = 'L' OR position = 'R' OR position = 'D'")
    	else
				if params[:position]=='G'
						@players = Player.where("position = 'G'")

			    	else
							if params[:position]=='F'
									@players = Player.where("position = 'C' OR position = 'L' or position = 'R'")
							else
								if params[:position]=='D'
									@players = Player.where("position = 'D'")
									else
										@players = Player.all
								
										respond_to do |format|
									  format.html # index.html.erb
									  format.json { render json: @player }
								end
							end
				end
    end
    end
  end

	def new
		@player = Player.new
	end

  def create
  	@player = Player.new.(params[:player])
	
			respond_to do |format|
	      if @player.save
	        format.html { redirect_to @player, notice: 'Player was successfully created.' }
	        format.json { render json: @player, status: :created, location: @player }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @player.errors, status: :unprocessable_entity }
	      end
    	end
  end

  private

  # i will need to add if user is owner of team to show the draftbutton and if team status is ready to pick
 
 # def show_button(player, league_id, team_id)
 # 	player.taken_for?(league_id) | team.owerner_of?(team_id) | team.status = 'ready_to_pick' ? false : true
 # end
 # helper_method :show_button


  def show_button(player, league_id)
  	player.taken_for?(league_id) ? false : true
  end
  helper_method :show_button


  def show_draftteam(player, league_id)
  	player.taken_for?(league_id) ? true : false
  end
  helper_method :show_draftteam

end
