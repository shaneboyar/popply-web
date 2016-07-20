class PagesController < ApplicationController
	skip_before_filter :require_user, only: :new

	def home
	end

	def about
	end

	def new
		@splashpage = true

		if user_is_logged_in?
			redirect_to user_path(User.find(session[:user_id]))
		end
	end

end
