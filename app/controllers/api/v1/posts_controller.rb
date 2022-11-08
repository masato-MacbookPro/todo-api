class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all.order(:id)
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def update
    post = Post.find(params[:id])
    if post.update(past_params)
      render json: post
    else
      render json: post.errors
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
