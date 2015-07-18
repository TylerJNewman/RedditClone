class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :url, :content))
    @post.sub 
  end

  def show

  end
end
