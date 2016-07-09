class PostsController < ApplicationController

	def new
		@post = current_user.posts.build
		respond_to do |format|               
			format.js
		end
	end 

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to user_path(current_user)
		else
			render root_path
		end
	end

	def destroy
		@post = current_user.posts.find_by(id: params[:id])
    	@post.destroy
    	redirect_to request.referrer || root_url
  end



	private

    def post_params
      params.require(:post).permit(:content)
    end

end
