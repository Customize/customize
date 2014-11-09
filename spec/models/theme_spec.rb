require "rails_helper"

describe Theme, type: :model do
  before :each do
    Theme.should_receive(:split_files).and_return(
      [["lib", "themes", "horizon"],
       ["lib", "themes", "horizon", "horizon.yml"],
       ["lib", "themes", "minimalist"],
       ["lib", "themes", "minimalist", "minimalist.yml"]])
  end

  describe "files" do
    it "return arranged files hash" do
      arrange = {
        themes: ["horizon", "minimalist"],
        about: ["horizon.yml", "minimalist.yml"]}

      expect(Theme.files).to eq(arrange)
    end
  end
end
