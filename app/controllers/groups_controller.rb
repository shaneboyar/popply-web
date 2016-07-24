class GroupsController < ApplicationController
	before_action :load_group, only: [:show, :update, :picks, :grouprankings, :posts, :chat]

	def load_group
  		@group = Group.find(params[:id])
	end


	def show
	end


	def new
		@group = @current_user.groups.build
		respond_to do |format|               
			format.js
		end
	end

	def create
		# hack to force the user to be both an owner, and have a membership
		# TODO: model owner on the membership model
		custom_params = { owner_id: @current_user.id, show_id: 1 }
		group_params_with_owner = group_params.merge(custom_params)
		@group = @current_user.groups.create(group_params_with_owner)
		if @group.save 
			redirect_to user_path(@current_user) 
		else 
		 	redirect_to '/' 
		end 
	end

	def update
		@group.members.push(@current_user)
		redirect_to request.referrer || root_url
	end

	def destroy
		@group = current_user.groups.find_by(id: params[:id])
    	@group.destroy
    	flash[:success] = "Group deleted"
    	redirect_to request.referrer || root_url
  	end

  	def picks
  		@picks = @group.memberships.find_by(user: @current_user).picks
  		respond_to do |format|               
			format.js
		end
	end

	def rankings
		@key = @group.show.keys
  		respond_to do |format|               
			format.js
		end
	end

	def posts
		@posts = Post.where(group: @group)
  		respond_to do |format|               
			format.js
		end
	end

	def chat
		respond_to do |format|               
			format.js
		end
	end


	private

	def group_params
		params.require(:group).permit(:title, :show_id)
	end

end
