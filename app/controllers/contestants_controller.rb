class ContestantsController < ApplicationController
	layout "admin", only: [:new, :create]

  def index
  	@contestants = Contestant.all
  end

  def new
  	@show = Show.find(params[:id])
  	@contestant = @show.contestants.build
  end

  def create
  	@show = Show.find(params[:id])
  	@contestant = @show.contestants.build(contestant_params)
  	if @contestant.save
  		redirect_to "/admin/shows/#{@show.id}/configure"
  	else
  		redirect_to request.referrer
  	end
  end


  def show
  	@contestant = Contestant.find(params[:id])
  end


  private

  def contestant_params
  	params.require(:contestant).permit(:name, :image, :bio, :age, :occupation)
  end

end
