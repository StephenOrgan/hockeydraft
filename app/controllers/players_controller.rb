class PlayersController < ApplicationController

	
	def index
		@league = League.find(params[:league_id])
		@team = Team.find(params[:team_id])
		#@takenpicks = Pick.where(:league_id=> @league)
		@pick = Pick.new league_id: params[:league_id]
		picks = Pick.where(league_id: params[:league_id], team_id: params[:team_id])
		@nextteam = Team.where(league_id: params[:league_id], status: 'ready_to_pick')
		result = picks.map {|pick| pick.player.position }.each_with_object(Hash.new(0)) {|each, result| result[each] += 1 }

		@resultforward = result["C"] + result["L"] + result["R"]
		@resultdefense = result["D"]
		@resultgoalie = result["G"]
		
		#Pick.find(:all, :conditions => { :league_id => params[:league_id] })
		#@takenteam = 
		#@playerpicks = Player.where(:id == Pick.player_id)

		case params[:position]
		when 'all'
    	@players = Player.where("position = 'C' OR position = 'L' OR position = 'R' OR position = 'D'")
    when 'G'
			@players = Player.where("position = 'G'")
		when 'F'
			@players = Player.where("position = 'C' OR position = 'L' or position = 'R'")
		when 'D'
			@players = Player.where("position = 'D'")
		else
			@players = Player.all
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


	def show_draftteam2(player, league_id)
   Pick.find(:first, :conditions => { :league_id => league_id, :player_id => player }).team.name

  end
  helper_method :show_draftteam2

  


end
