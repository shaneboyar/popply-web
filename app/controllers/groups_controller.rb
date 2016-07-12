class GroupsController < ApplicationController

	def new
		@group = current_user.groups.build
		respond_to do |format|               
			format.js
		end
	end

	def create
	  # hack to force the user to be both an owner, and have a membership
	  # TODO: model owner on the membership model
	  puts "CURRENT USER:", @current_user.id
	  custom_params = { owner_id: @current_user.id }
	  group_params_with_owner = group_params.merge(custom_params)
	  puts "********\n********\n********\n********\n********\n********\n"
	  puts group_params_with_owner.inspect
	  @group = @current_user.groups.create(group_params_with_owner)
	  if @group.save  
	      puts "********\n********\nAND AFTER:"
	      puts @group.inspect
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
		params.require(:group).permit(:title)
	end

end
