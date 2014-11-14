require "rails_helper"

describe "save_themes" do
  before :each do
    @info = [{:name=>"Horizon", :description=>"lorem ipsum dolor sit", :author=>"Londerson", :site=>"londerson.github.io", :email=>"londerson@gmail.com", :version=>0.1}, {:name=>"Minimalist", :description=>"lorem ipsum dolor sit", :author=>"Londerson", :site=>"londerson.github.io", :email=>"londerson@gmail.com", :version=>0.1}]
  end

  it "save themes" do
    Theme.save_themes(@info)
    expect(Theme.count).to eq(2)
  end

  context "when have themes saved" do
    before :each do
      Theme.save_themes(@info)
      Theme.save_themes(@info)
    end

    it "not save repeated themes" do
      expect(Theme.count).to eq(2)
    end
  end
end
