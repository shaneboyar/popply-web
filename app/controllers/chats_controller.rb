class ChatsController < ApplicationController

	def new
		@group = Group.find(params[:id])
		@chat = @group.chats.build
	end

	def create
		respond_to do |format|
			@group = Group.find(params[:id])
			@member = Membership.where(group: @group).where(user: current_user).first
			custom_params = {user_id: current_user.id}
			chat_params_with_creator = chat_params.merge(custom_params)
			@chat = @group.chats.build(chat_params_with_creator) 
			if @chat.save  
				flash.now[:success] = 'Your comment was successfully posted!' 
			else 
				flash[:error] = 'Your comment cannot be saved.'
			end
			format.html {redirect_to group_chat_path(@group)}
      		format.js
		end
	end


	private

	def chat_params
		params.require(:chat).permit(:body)
    end

end
