class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :not_autopost,   only:  :destroy
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      @successmsg = "<h3>Nice post, brother!</h3><br />"
      @successmsg = @successmsg + "<h4>Now hit the gym, there ain't much time left to get ring ready!</h4><br />"
      flash[:success] = @successmsg
      redirect_to root_url
    else
      #break from the error partial
      #so we can do a full width error message
      #and so that we can redirect, keeping the feed on screen
      @errormsg = "<h3>Looks like someone wants to meet the pythons!</h3><br />"
      @errormsg = @errormsg + "<h4>Quit messin' around and fix this mess, brother:</h4><br />"
      count = 0
      @micropost.errors.full_messages.each do |msg|
        count+=1
      @errormsg = @errormsg + count.to_s + ". " + msg + "<br/>"
      end
      redirect_to root_url, :flash => { :danger => @errormsg }
    end
  end

  def destroy
    @micropost.destroy
    @successmsg = "<h3>That post is toast, brother!</h3><br />"
    @successmsg = @successmsg + "<h4>The Hulkster gave it an atomic leg drop for ya!</h4><br />"
    flash[:success] = @successmsg
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    #users can't delete auto generate posts created for them.  Automatic statuses.
    def not_autopost
      @micropost = current_user.microposts.find_by(id: params[:id])
      if @micropost.autopost == true
        redirect_to root_url
      end
    end
end
