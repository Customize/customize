require "rails_helper"

RSpec.describe Admin::PostsController, type: :controller do
  describe "GET show" do
    before :each do
      
    end

    it "return single post" do
      get :edit, id: @post
    end
  end
end
