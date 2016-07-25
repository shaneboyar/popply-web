class AdminController < ApplicationController
	before_action :admin_user
	layout "admin"


	def home
		@users = User.all.paginate(page: params[:page]).per_page(10)
		@groups = Group.all.paginate(page: params[:page]).per_page(10)
		@shows = Show.all.paginate(page: params[:page]).per_page(10)
		@posts = Post.all.paginate(page: params[:page]).per_page(10)
	end

	def groups
		@groups = Group.all.paginate(page: params[:page]).per_page(10)
	end

	def shows
		@shows = Show.all.paginate(page: params[:page]).per_page(10)
	end


private

	#Confirms an admin user.
	def admin_user
	  redirect_to user_path(@current_user) unless current_user.admin?
	end

end
