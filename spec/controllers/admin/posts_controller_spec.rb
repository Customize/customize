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

  describe "GET new" do
    it "return new instance" do
      get :new
      expect(assigns(:post)).to be_an_instance_of(Post)
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
      expect(response).to redirect_to(edit_admin_post_path(@post))
      expect(flash[:success]).to eq("Post updated with success!")
    end
  end

  describe "POST destroy" do
    before :each do
      @post = Post.create(title: "Tite")
    end

    it "destroy post" do
      post :destroy, id: @post
      expect(Post.count).to eq(0)
      expect(response).to redirect_to(admin_posts_path)
      expect(flash[:success]).to eq("Post deleted!")
    end
  end
end
