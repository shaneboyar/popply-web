class PicksController < ApplicationController

	def new
		@group = Group.find(params[:id])
		@week = @group.show.show_weeks.find_by(week: params[:week])
		@new_pick = @group.memberships.find_by(user_id: current_user.id).picks.build
	end

	def create
		@group = Group.find(params[:id])
		params["pick"]["contestant_id"][0..-2].each do |contestant_id|
			@new_pick = @group.memberships.find_by(user: current_user).picks.create(contestant_id: contestant_id, week: params["pick"]["week"])
		end
		if @group.save  
		  redirect_to group_path(@group)  
		else 
		  redirect_to group_path(@group) 
		end
	end




	private

	def pick_params
		params.permit(:contestant_id, :week)
	end

end
