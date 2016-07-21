class ShowsController < ApplicationController
	layout "admin", only: [:new, :key, :keyedit, :configure]

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
		@new_key = @show.keys.build
	end

	def keycreate
		@show = Show.find(params[:id])
		@new_key = @show.keys.build
		params["key"]["contestant_id"][0..-2].each do |contestant_id|
			@new_key = @show.keys.create(contestant_id: contestant_id, week: params["key"]["week"])
		end
		if @new_key.save  
		  redirect_to show_weeks_path(@show)  
		else 
		  redirect_to show_weeks_path(@show)
		end
	end

	def keyedit
		@key = Key.where(show: params[:id]).where(week: params[:week])
	end

	def keyupdate
		@key = Key.where(show: params[:id]).where(week: params[:week])
		params["key"]["contestant_id"][0..-2].each do |contestant_id|
			@key = @show.keys.update_attributes(contestant_id: contestant_id, week: params["key"]["week"])
		end
  		if @key.save
  			redirect_to show_week_path(@show)
  		else
  			redirect_to show_week_path(@show)
  		end
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

	def key_params
		params.permit(:contestant_id, :week)
	end
	

end
