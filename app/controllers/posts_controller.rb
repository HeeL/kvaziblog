class PostsController < ApplicationController

  PER_PAGE = 15

  def index
    @posts = Post.active.by_newest.page(params[:page]).per(PER_PAGE)
    respond_to do |format|
      format.html {render :index}
      format.rss  {render action: 'feed', layout: false}
    end
  end

  def show
    post = current_admin_user ? Post : Post.active
    @post = post.find(params[:id])
  end

end
