class Admin::PostsController < Admin::ApplicationController

  def edit
    @post = Post.find(params[:id])
  end

end
