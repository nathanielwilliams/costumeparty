class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :index, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page], :per_page => 5).order('name ASC')
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flashmsg = "<h3>Your Profile has been Created!</h3><br />"
      flashmsg += "<h4>To all my little Hulkamaniacs,<br/>say your prayers,<br/>take your vitamins,<br/>and you just might survive sharing the ring with me.</h4>"
      flash[:success] = flashmsg
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flashmsg = "<h3>Your Profile has been Updated!</h3><br />"
      flashmsg += "<h4>This pleases the hulk almost as much as being a champion does.</h4>"
      flash[:success] = flashmsg
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "<h3>The Weak will be Destroyed, Brother!</h3><h4>The Hulkster's happy to report that this unworthy competitor has been removed from the ring.</h4>"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flashmsg = "<h3>You Need to Login, brother!</h3><br />"
        flashmsg += "<h4>The thought of some unauthorized chump or chumpette creepin' around the Hulkster's home, invading the privacy of all these Hulkamaniacs...it's riling up these pythons. <br/> If I were you, I'd hightail it outta here while your legs still work.</h4>"
        flash[:danger] = flashmsg
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      if (@user != current_user)
        flashmsg = "<h3>That ain't your account, brother!</h3><br />"
        flashmsg += "<h4>Stick to managing your own profile, or this will end with an atomic leg drop.</h4>"
        flash[:danger] = flashmsg
        redirect_to(root_url)
      end

    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
