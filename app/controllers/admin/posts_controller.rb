class Admin::PostsController < Admin::ApplicationController
  
  before_filter :fetch_post, only: [:edit, :update, :destroy]
  before_filter :get_pages,  only: [:new, :edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    if Post.create(post_params)
      redirect_to admin_posts_path, flash: { success: "Post created with success!" }
    else
      render action: 'new'
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to edit_admin_post_path(@post), flash: { success: "Post updated with success!" }
    else
      render action: 'edit'
    end
  end

  def destroy
    if @post.destroy!
      redirect_to admin_posts_path, flash: { success: "Post deleted!"}
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :page_id)
    end

    def fetch_post
      @post = Post.find(params[:id])
    end

    def get_pages
      @pages = Page.all
    end
end
