class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :complete]
  before_action :correct_user,   only: [:destroy, :complete]
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    # @collab1 = User.find_by(email: "april@gmail.com")
    # @micropost.collab1 = @collab1.id
    # # @micropost.collab2 = User.find_by(email: params[:collab2]).id
    # # @micropost.collab3 = User.find_by(email: params[:collab3]).id
    # @micropost.description = params[:description]
    # @micropost.content = params[:content]
    if @micropost.save
      flash[:success] = "Task created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def feed
    following_ids_subselect = "SELECT followed_id FROM relationships
                               WHERE  follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids_subselect})
                     OR user_id = :user_id", user_id: id)
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Task deleted!"
    redirect_to request.referrer || root_url
  end
  
def complete
   @micropost.destroy
   flash[:success] = "Task completed!"
  redirect_to request.referrer || root_url
end

  
  private
    
    def micropost_params
      params.require(:micropost).permit(:content, :collab1, :collab2, :collab3, :description, :picture)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
