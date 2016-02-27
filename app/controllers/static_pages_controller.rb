class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      # @feed_items = Micropost.where{|x| x.collab1 == current_user.email || x.collab2 == current_user.id}
    end
  end
end
