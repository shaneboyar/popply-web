class PostsController < ApplicationController

	def new
		@group = Group.find(params[:id])
		@post = @group.posts.build
	end

	def create
		@group = Group.find(params[:id])
		@members = Membership.where(group: @group)
		@member = Membership.where(group: @group).where(user: current_user).first
		custom_params = {user_id: current_user.id}
		post_params_with_creator = post_params.merge(custom_params)
		@post = @group.posts.build(post_params_with_creator) 
		if @post.save
			@members.each do |member|
				PostMailer.view_new_post(member).deliver_now
			end
			redirect_to group_posts_path(@group) 
		else 
			redirect_to group_posts_path(@group) 
		end
	end

	def group_posts
		@group = Group.find(params[:id])
		@posts = Post.where(group: @group)
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
  			redirect_to group_path(Group.find(@post.group_id))
  		else
  			redirect_to group_path(Group.find(@post.group_id))
  		end
  	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to request.referrer || root_url
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
    end

end
