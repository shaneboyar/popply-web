class UsersController < ApplicationController
	before_filter :be_the_right_user, only: [:edit]


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save 
    		session[:user_id] = @user.id 
    		redirect_to '/' 
  		else 
    		redirect_to '/signup' 
  		end 
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(created_at: :desc).paginate(page: params[:page]).per_page(10)
	end

	def edit
    	@user = User.find(params[:id])
  	end

  	def update
  		@user = User.find(params[:id])
  		if @user.save
  			redirect_to user_path
  		else
  			redirect_to edit_user_path
  		end
  	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

	def be_the_right_user
		@user = User.find(params[:id])
		unless current_user.id == @user.id
			redirect_to root_path
		end
	end 

end
