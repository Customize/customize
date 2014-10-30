require "rails_helper"

RSpec.describe Admin::PostsController, type: :controller do
  
  describe "GET index" do
    before :each do
      @post  = Post.create(title: "Post Title")
      @post2 = Post.create(title: "Post Title2")
    end

    it "return all posts" do
      get :index
      expect(assigns(:posts).to_a).to eq([@post, @post2])
    end
  end

  describe "GET show" do
    before :each do
      @post = Post.create(title: "Title Post")     
    end

    it "return single post" do
      get :edit, id: @post
      expect(assigns(:post)).to eq(@post)
    end
  end

  describe "POST create" do
    it "create post" do
      post :create, post: { title: "Title Post" }
      expect(Post.last.title).to eq("Title Post")
      response.should redirect_to(admin_posts_path)
      flash[:success].should include("Post created with success!")
    end
  end

  describe "POST update" do
    before :each do
      @post = Post.create(title: "Post Title")
    end

    it "update post" do
      post :update, id: @post, post: { title: "Post Updated!" }
      expect(@post.reload.title).to eq("Post Updated!")
      response.should redirect_to edit_admin_post_path(@post)
      flash[:success].should include("Post updated with success!")
    end
  end
end
