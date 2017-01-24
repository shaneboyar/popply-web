class GroupsController < ApplicationController
	before_action :load_group, only: [:show, :update, :picks, :rankings, :posts, :contestants, :chat]

	def load_group
  		@group = Group.find(params[:id])
	end


	def show
	end


	def new
		@group = current_user.groups.build
		@shows = Show.all
		respond_to do |format|
			format.js
		end
	end

	def create
		# hack to force the user to be both an owner, and have a membership
		# TODO: model owner on the membership model
		custom_params = { owner_id: current_user.id }
		group_params_with_owner = group_params.merge(custom_params)
		@group = current_user.groups.create(group_params_with_owner)
		if @group.save
			flash[:success] = 'Group created.'
			redirect_to group_path(@group)
		else
		 	redirect_to '/'
		end
	end

	def update
		@group.members.push(current_user)
		redirect_to request.referrer || root_url
	end

	def destroy
		@group = Group.find(params[:id])
  	@group.destroy
  	flash[:success] = "Group deleted"
  	redirect_to request.referrer || root_url
	end

	def picks
  	@picks = @group.memberships.find_by(user: current_user).picks
	end

	def rankings
		@key = @group.show.keys
		@members = @group.memberships
	end

	def posts
		@posts = Post.where(group: @group).order(created_at: :desc)
	end

	def contestants
		@contestants = @group.show.contestants
	end

	def chat
		@new_chat = @group.chats.build
		@chats = Chat.where(group: @group).order(created_at: :desc).limit(50)
	end


	private

	def group_params
		params.require(:group).permit(:title, :show_id)
	end

end
