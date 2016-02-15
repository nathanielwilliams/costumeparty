class WrestlersController < ApplicationController
  def index
    #@user = User.find(params[:id])
    #Wrestler.find(params[:id])
    @allwrestlers = Wrestler.includes(:user).paginate(:page => params[:page], :per_page => 5)
  end

  def show

  end


end
