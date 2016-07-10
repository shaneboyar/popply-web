class PagesController < ApplicationController
	skip_before_filter :require_user, only: :new

	def home
	end

	def about
	end

	def new
		@splashpage = true
	end

end
