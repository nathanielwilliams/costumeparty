class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flashmsg = "<img src='/assets/pythonpoint.jpg' alt='Python Patrol' class='flashimg' />"
flashmsg += "<h3>Those credentials aren't legit</h3><br />"
      flashmsg += "<h4>Lying to the hulkster's a great way to meet the pythons, brother!</h4>"
      flash.now[:danger] = flashmsg.html_safe # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
