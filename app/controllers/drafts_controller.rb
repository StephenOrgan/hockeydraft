class DraftsController < ApplicationController
  def create
  	@league = League.find(params[:league_id])
  	@league.start_draft
  	redirect_to @league
  end
end
