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

	def keycreate #VERY BADLY NEEDS REFACTORING
		@show = Show.find(params[:id])
		@new_key = @show.keys.build
		week = 
		
		params["key"]["contestant_id"][0..-2].each do |contestant_id|
			@new_key = @show.keys.create(contestant_id: contestant_id, week: params["key"]["week"])
		end
		
		keys = Key.where(show: @show).where(week: params["key"]["week"])
		winners = []
		
		keys.each do |key|
			winner = Contestant.find(key.contestant_id)
			winners.push(winner)
		end
		
		players = Membership.where(group: Group.where(show_id: @show.id))
		players.each do |player|
			player_picks = player.picks.where(week: params["key"]["week"])
			player_winners = []
			
			player_picks.each do |player_pick|
				player_winner = Contestant.find(player_pick.contestant_id)
				player_winners.push(player_winner)
			end
			
			matches = winners & player_winners

			#TODO - LET ADMIN CONFIGURE SCORING STRUCTURE
			if params["key"]["week"].to_i < 7
				player.score = player.score + matches.count
			elsif params["key"]["week"].to_i == 7
				player.score = player.score + (matches.count * 10)
			elsif params["key"]["week"].to_i == 8
				player.score = player.score + (matches.count * 15)
			elsif params["key"]["week"].to_i == 9
				player.score = player.score + (matches.count * 20)
			elsif params["key"]["week"].to_i == 10
				player.score += (matches.count * 30)
			end		

			player.save
		end
		
		redirect_to show_weeks_path(@show)
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
