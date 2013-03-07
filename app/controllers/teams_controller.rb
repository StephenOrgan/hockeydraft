class TeamsController < ApplicationController
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team }
    end
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @team = Team.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /leagues/new
  # GET /leagues/new.json
  def new
    @team = Team.new league_id: params[:league_id]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /leagues/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'League was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leagues/1
  # PUT /leagues/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'League was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url }
      format.json { head :no_content }
    end
  end
end
