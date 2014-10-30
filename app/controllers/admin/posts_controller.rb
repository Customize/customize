class Admin::PostsController < Admin::ApplicationController

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    
  end

  def create
    if Post.create(post_params)
      redirect_to admin_posts_path, flash: { success: "Page created with success!" }
    else
      render action: 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title)
    end
end
