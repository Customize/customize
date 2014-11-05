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
  end
end
