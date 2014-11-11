require "rails_helper"

describe Admin::ThemesController, type: :controller do
  before :each do
    @theme = Theme.create(name: "Theme Name")
  end

  describe "GET index" do
    it "return all themes" do
      get :index
      expect(assigns(:themes)).to eq([@theme])
    end
  end
end
