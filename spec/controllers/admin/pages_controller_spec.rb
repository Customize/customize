require "rails_helper"

RSpec.describe Admin::PagesController, type: :controller do
  

  describe "GET index" do
    context "has pages created" do
      before :each do
        @page = Page.create(title: "Title")
        @page = Page.create(title: "Title2")
      end

      it "return all" do
        expect(assigns(:pages)).to eq([@page, @page2])
      end
    end

    context "no pages created" do
      it "return empty array" do
        expect(assigns(:pages)).to eq([])
      end
    end
  end
end
