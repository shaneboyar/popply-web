class ShowWeeksController < ApplicationController


	def create
		@show = Show.find(params[:id])
		@show_week = @show.show_weeks.build(week_params)
		if @show_week.save 
    		redirect_to request.referrer
  		else 
    		redirect_to request.referrer
  		end 
	end

	def week_params
		params.require(:show_week).permit(:picklimit, :week)
	end

end
