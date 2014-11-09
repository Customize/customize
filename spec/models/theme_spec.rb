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
end
