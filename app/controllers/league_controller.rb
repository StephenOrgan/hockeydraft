class LeagueController < ApplicationController
  
  def index
    @leagues = League.all

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leagues }
    end

 end