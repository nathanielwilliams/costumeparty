class WrestlersController < ApplicationController
  before_action :logged_in_user, only: [:create, :update, :edit, :index, :destroy]
  before_action :admin_user,     only: [:destroy]
  def index
    @allwrestlers = Wrestler.includes(:user).paginate(:page => params[:page], :per_page => 5)
  end

  def Show
    @wrestler = Wrestler.find(params[:id])
  end

  def new
    @wrestler = Wrestler.new
  end

  def create
    @wrestler = Wrestler.new(user_params)
    if @wrestler.save

      flashmsg = "<h3>Wrestler Created!</h3><br />"
      flash[:success] = flashmsg
      redirect_to new_wrestler_path
    else
      render 'new'
    end
  end

  def update
    @wrestler = Wrestler.find(params[:id])
    if @wrestler.update_attributes(user_params)
      flashmsg = "<h3>Wrestler Updated!</h3><br />"
      flash[:success] = flashmsg
      redirect_to wrestlers_url
    else
      render 'edit'
    end
  end

  def edit
    @wrestler = Wrestler.find(params[:id])
  end

  def destroy
    Wrestler.find(params[:id]).destroy
    flash[:success] = "<h3>The Weak will be Destroyed, Brother!</h3><h4>The Hulkster's happy to report that this unworthy competitor has been removed from the ring.</h4>"
    redirect_to wrestlers_url
  end

  private

    def user_params
      params.require(:wrestler).permit(:name, :image, :slogan)
    end

    def logged_in_user
      unless logged_in?
        store_location
        flashmsg = "<h3>You Need to Login, brother!</h3><br />"
        flashmsg += "<h4>The thought of some unauthorized chump or chumpette creepin' around the Hulkster's home, invading the privacy of all these Hulkamaniacs...it's riling up these pythons. <br/> If I were you, I'd hightail it outta here while your legs still work.</h4>"
        flash[:danger] = flashmsg
        redirect_to login_url
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
