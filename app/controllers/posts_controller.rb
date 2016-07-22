class PostsController < ApplicationController

	def new
		@member = Membership.where(group_id: params["id"]).where(user: @current_user)
		@group = Group.find(params[:id])
		@post = @group.memberships.find_by(user_id: @current_user.id).posts.build
	end

	def create
		@group = Group.find(params[:id])
		@post = @group.memberships.find_by(user_id: @current_user.id).posts.create(post_params) 
		if @group.save  
			redirect_to group_path(@group) 
		else 
			redirect_to group_path(@group) 
		end
	end

	def edit
	end

	def destroy
	end

	private

	def post_params
		params.require(:post).permit(:content)
    end

end
