class PostsController < ApplicationController
  before_filter :fetch_post, only: [:show]

  def show
  end

  private
    def fetch_post
      @post = Post.find(params[:id])
    end
end
