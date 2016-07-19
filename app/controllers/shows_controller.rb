class ShowsController < ApplicationController
	layout "admin", only: [:new, :key, :configure]

	def new
		@show = Show.new
	end

	def create
		@show = Show.new(show_params)
		if @show.save 
    		redirect_to show_weeks_path(@show)
  		else 
    		redirect_to admin_shows_path
  		end 
	end

	def key
		@show = Show.find(params[:id])
	end

	def configure
		@show = Show.find(params[:id])
		@show_week = @show.show_weeks.build

	end

	def destroy
		@show = Show.find_by(id: params[:id])
    	@show.delete
    	redirect_to admin_shows_path
  	end


	private

	def show_params
		params.require(:show).permit(:title, :start)
	end
	

end
