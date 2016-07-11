class GroupsController < ApplicationController

	def new
		@group = current_user.groups.build
		respond_to do |format|               
			format.js
		end
	end

	def create
		@group = @current_user.groups.create(group_params)
		if @group.save  
    		redirect_to user_path(@current_user) 
  		else 
    		redirect_to '/' 
  		end 
	end

	def destroy
		@group = current_user.groups.find_by(id: params[:id])
    	@group.destroy
    	redirect_to request.referrer || root_url
  	end


	private

	def group_params
		params.require(:group).permit(:title, :owner_id)
	end

end
