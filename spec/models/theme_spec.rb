require "rails_helper"

describe Theme, type: :model do
  before :each do
    Theme.should_receive(:read_files).and_return(
      [["lib", "themes", "horizon"],
       ["lib", "themes", "horizon", "horizon.yml"],
       ["lib", "themes", "minimalist"],
       ["lib", "themes", "minimalist", "minimalist.yml"]])
  end

  describe "list_themes" do
    it "return list of theme folders" do
      expect(Theme.list_themes).to eq(["horizon", "minimalist"])
    end
  end

  describe "read_info" do
    it "parse information of themes and put on hash" do
      info = [{:name=>"Horizon", :description=>"lorem ipsum dolor sit", :author=>"Londerson", :site=>"londerson.github.io", :email=>"londerson@gmail.com", :version=>0.1}, {:name=>"Minimalist", :description=>"lorem ipsum dolor sit", :author=>"Londerson", :site=>"londerson.github.io", :email=>"londerson@gmail.com", :version=>0.1}]
      expect(Theme.read_info).to eq(info)
    end
  end

  describe "get_saved_themes" do
    before :each do
      Theme.save_themes
    end

    it "return names of themes saved" do
      names = Theme.get_saved_themes
      expect(names).to eq(["Horizon", "Minimalist"])
    end
  end

  describe "save_themes" do

    it "save themes" do
      Theme.save_themes
      expect(Theme.count).to eq(2)
    end

    context "when have themes saved" do
      before :each do
        Theme.should_receive(:read_files).and_return(
          [["lib", "themes", "horizon"],
           ["lib", "themes", "horizon", "horizon.yml"],
           ["lib", "themes", "minimalist"],
           ["lib", "themes", "minimalist", "minimalist.yml"]])

        Theme.save_themes
        Theme.save_themes
      end

      it "not save repeated themes" do
        expect(Theme.count).to eq(2)
      end
    end
  end
end
