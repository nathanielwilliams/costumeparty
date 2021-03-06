class PasswordResetsController < ApplicationController
  before_action :get_user,         only: [:edit, :update]
  before_action :valid_user,       only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      #Autopost that they signed up
      @autopostcontent = "Jabroni Alert! I (" + @user.name + ") forgot my password and had to ask the #HULKSTER to reset it! #JABRONI #JINNYXXXI"
      Micropost.create(:user_id => @user.id, :content => @autopostcontent, :autopost => true)
      posttweet(@autopostcontent)
      flash[:success] = "<h3>Sent you an email with instructions, brother!</h3>"
      redirect_to root_url
    else
      flash.now[:danger] = "<h3>Email address not found</h3><h4>You know I used to know a guy that tried to pull a fast one on me...it was the last thing he ever did.</h4>"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, "can't be empty")
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "<h3>We're back i nbusiness, brother!</h3>"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # Before filters

    def get_user
      @user = User.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_user
      unless (@user &&
              @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # Checks expiration of reset token.
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
