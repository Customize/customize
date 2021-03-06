require "rails_helper"

RSpec.describe Admin::PagesController, type: :controller do

  describe "GET index" do
    context "has pages created" do
      before :each do
        @page  = Page.create(title: "Title")
        @page2 = Page.create(title: "Title2")
      end

      it "return all" do
        get :index
        expect(assigns(:pages).to_a).to eq([@page, @page2])
      end
    end

    context "no pages created" do
      it "return empty array" do
        get :index
        expect(assigns(:pages).to_a).to eq([])
      end
    end
  end

  describe "GET new" do
    it "return new instance" do
      get :new
      expect(assigns(:page)).to be_an_instance_of(Page)
    end
  end

  describe "GET edit" do
    before :each do
      @page = Page.create(title: "Page Title")
    end

    it "return page" do
      get :edit, id: @page
      expect(assigns(:page)).to eq(@page)
    end
  end

  describe "POST create" do
    it "create page" do
      post :create, page: { title: "Page Title", content: "Page Content" }
      expect(Page.last.title).to eq("Page Title")
      expect(response).to redirect_to(admin_pages_path)
      expect(flash[:success]).to eq("Page created with success!")
    end
  end

  describe "POST update" do
    before :each do
      @page = Page.create(title: "Page Title")
    end
    
    it "update page" do
      post :update, id: @page, page: { title: "Title Updated" }
      expect(@page.reload.title).to eq("Title Updated")
      expect(response).to redirect_to(edit_admin_page_path(@page))
      expect(flash[:success]).to eq("Page updated with success!")
    end
  end
end
