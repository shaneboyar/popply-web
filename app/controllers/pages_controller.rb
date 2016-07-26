class PagesController < ApplicationController
	skip_before_filter :authenticate_user!, only: :new

	def home
	end

	def about
	end

	def new
		@splashpage = true

		if user_signed_in?
			redirect_to user_path(current_user)
		end
	end

end
