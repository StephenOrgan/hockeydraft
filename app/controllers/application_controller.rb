class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  #def after_sign_in_path_for(resource)
  #	@url = url_for(:only_path => false)

  #	if @url != leagues_path
  #		players_path
  #	else
	#		leagues_path
	#	end
	#end

end
