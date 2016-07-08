class SignupsController < ApplicationController

	def new
		@new = Signup.new
	end

	def create
		@user = Signup.new(signup_params)
		if @user.save
			redirect_to thanks_path
		else
			render 'new'
		end
	end


	private

	def signup_params
		params.require(:signup).permit(:firstname, :email)
    end

end
