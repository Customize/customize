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
end
