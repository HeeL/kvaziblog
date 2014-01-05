class PostsController < ApplicationController

  PER_PAGE = 15

  def index
    @posts = Post.active.by_newest.page(params[:page]).per(PER_PAGE)
  end

  def show
    @post = Post.active.find(params[:id])
  end

end
