class UserController < ApplicationController

before_filter :authenticate_user!

	def index
		render
	end



end
