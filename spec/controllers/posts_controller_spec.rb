require "rails_helper"

describe PostsController, type: :controller do
  before :each do
    @post = Post.create(title: "Post Title")
  end

  describe "GET show" do
    it "return current post" do
      get :show, id: @post
      expect(assigns(:post).title).to eq("Post Title")
    end
  end
end
