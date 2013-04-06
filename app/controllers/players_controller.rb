class PlayersController < ApplicationController

	
	def index
		@league = League.find(params[:league_id])
		@team = Team.find(params[:team_id])
		@takenpicks = Pick.where(:league_id=> @league)
		#@teampicks = player.picks.first.team.name
		@pick = Pick.new league_id: params[:league_id]
  

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

  def show_button(player, league_id)
  	player.taken_for?(league_id) ? false : true
  end
  helper_method :show_button

  def show_draftteam(player, league_id)
  	player.taken_for?(league_id) ? true : false
  end
  helper_method :show_draftteam

end
