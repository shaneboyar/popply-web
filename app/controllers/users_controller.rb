class UsersController < ApplicationController
	skip_before_filter :require_user, only: [:new, :create]
	before_filter :be_the_right_user, only: [:edit]


	def new
		@user = User.new
		respond_to do |format|               
			format.js
		end
	end

	def create
		@user = User.new(user_params)
		if @user.save 
    		session[:user_id] = @user.id 
    		redirect_to user_path(@user) 
  		else 
    		redirect_to splash_page_path
  		end 
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@groups = @user.groups.order(created_at: :desc).paginate(page: params[:page]).per_page(10)
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
