class PicksController < ApplicationController

	def new
		@group = Group.find(params[:id])
		@new_pick = @group.memberships.find_by(user_id: @current_user.id).picks.build
	end

	def create
		@group = Group.find(params[:id])
		puts "\n\n\n#{@group.memberships.find_by(user: @current_user).picks}\n\n\n\n\n\n\n\n"
		@new_pick = @group.memberships.find_by(user: @current_user).picks.create(pick_params)
		if @group.save  
		  redirect_to user_path(@current_user) 
		else 
		  redirect_to '/' 
		end
	end




	private

	def pick_params
		params.permit(:contestant_id, :week)
	end

end
