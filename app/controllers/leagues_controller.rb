class LeaguesController < ApplicationController

	def index
		@leagues = League.all
	end

	def show
		@league = League.find(params[:id])
	end

	def new
		@league = current_user.leagues.build
		respond_to do |format|               
			format.js
		end
	end 

	def create
		@league = current_user.leagues.build(league_params)
		@league.owner = current_user
		@league.players.push(current_user)
		if @league.save
			redirect_to user_path(current_user)
		else
			redirect_to league_path(@league)
		end
	end

	def destroy
		@league = current_user.leagues.find_by(id: params[:id])
    	@league.destroy
    	redirect_to request.referrer || root_url
    end

    def league_params
      params.require(:league).permit(:name)
    end

end
