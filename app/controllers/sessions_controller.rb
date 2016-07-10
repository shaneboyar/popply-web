class SessionsController < ApplicationController

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
	    redirect_to '/login'
	  end 
	end

	def destroy 
	  session[:user_id] = nil 
	  redirect_to '/' 
	end

end
