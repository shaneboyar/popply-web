class PostsController < ApplicationController

	def new
		@member = Membership.where(group_id: params["id"]).where(user: current_user)
		@group = Group.find(params[:id])
		@post = @group.memberships.find_by(user_id: current_user.id).posts.build
	end

	def create
		@group = Group.find(params[:id])
		@member = Membership.where(group: @group).where(user: current_user).first
		custom_params = {group: @group}
		post_params_with_creator = post_params.merge(custom_params)
		@post = @group.memberships.find_by(user: current_user).posts.build(post_params_with_creator) 
		if @post.save  
			redirect_to group_path(@group) 
		else 
			redirect_to group_path(@group) 
		end
	end

	def group_posts
		@group = Group.find(params[:id])
		@posts = Post.where(group: @group)
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
