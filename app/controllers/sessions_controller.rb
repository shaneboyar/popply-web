class SessionsController < ApplicationController
	skip_before_filter :require_user, only: [:new, :create]

	def new
		respond_to do |format|               
			format.js
		end
	end

	def create
	  @user = User.find_by_email(params[:session][:email])
	  if @user && @user.authenticate(params[:session][:password])
	    session[:user_id] = @user.id
	    redirect_to user_path(@user)
	  else
	  	flash[:danger] = 'Invalid email/password combination'
	    redirect_to '/'
	  end 
	end

	def destroy 
	  session[:user_id] = nil 
	  redirect_to '/' 
	end

end
