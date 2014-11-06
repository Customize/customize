require "rails_helper"

describe PagesController, type: :controller do
  before :each do
    @page = Page.create(title: "Page Title")
  end

  describe "GET show" do
    it "return current page" do
      get :show, id: @page
      expect(assigns(:page).title).to eq("Page Title")
    end

    context "when current page have posts" do
      before :each do
        @postA = Post.create(title: "Title A")
        @postB = Post.create(title: "Title B")
        @page.posts << [@postA, @postB]
        @page.save!
      end

      it "show posts" do
        get :show, id: @page
        expect(assigns(:posts)).to eq([@postA, @postB])
      end
    end
  end
end
