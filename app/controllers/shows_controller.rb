class ShowsController < ApplicationController
	layout false, only: [:new]

	def new
		@show = Show.new
	end

	def create
		@show = Show.new(show_params)
		if @show.save 
    		redirect_to admin_shows_path
  		else 
    		redirect_to admin_shows_path
  		end 
	end

	def key
		@show = Show.find(params[:id])
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
