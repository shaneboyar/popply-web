class CommentsController < ApplicationController
	def new
		#@comment = @post.comments.build
	end

	def create
		@post = Post.find(params[:post_id])
		custom_params = {user_id: current_user.id}
		comment_params_with_creator = comment_params.merge(custom_params)
		@comment = @post.comments.build(comment_params_with_creator)
		if @comment.save  
			redirect_to group_posts_path(Group.find(@post.group_id)) 
		else 
			redirect_to group_posts_path(Group.find(@post.group_id)) 
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
		if @post.update_attributes(comment_params)
  			redirect_to group_posts_path(Group.find(@post.group_id))
  		else
  			redirect_to group_posts_path(Group.find(@post.group_id))
  		end
  	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to request.referrer || root_url
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
    end

end

