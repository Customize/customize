require "rails_helper"

RSpec.describe Admin::PostsController, type: :controller do
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
