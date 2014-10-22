require "rails_helper"

RSpec.describe Admin::StaticPagesController, type: :controller do
  describe "GET home" do
    it "return success" do
      get :home
      expect(response.status).to eq(200)
    end
  end
end
