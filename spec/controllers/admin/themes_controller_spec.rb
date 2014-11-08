require "rails_helper"

describe Admin::ThemesController, type: :controller do
  before :each do
  end

  describe "GET index" do
    it "return all themes" do
      get :index
    end
  end
end
