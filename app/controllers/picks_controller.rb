class PicksController < ApplicationController

	def new
		@pick = Pick.new
		@league = League.find(params[:league_id])
		@team = Team.find(params[:team_id])
		@player = Player.find(params[:player_id])
			
			respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pick }
    end
  end
  	
  def create
    @pick = Pick.new(params[:pick])


    respond_to do |format|
      if @pick.save
        format.html { redirect_to players_path(params.merge(:league_id => @pick.league_id, :team_id => @pick.team_id)), notice: 'League was successfully created.' }
        format.json { render json: @pick, status: :created, location: @pick }
      else
        format.html { render action: "new" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

end
