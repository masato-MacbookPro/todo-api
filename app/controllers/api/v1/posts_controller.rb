class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all.order(:id)
    render json: posts
  end
end
