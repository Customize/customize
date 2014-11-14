require "spec_helper"
require "./lib/customize/theme_instalation"

describe ThemeInstalation do
  before :each do
    @themes_path = "lib/themes/**/*"
    @splited_files = [["lib", "themes", "horizon"],
                     ["lib", "themes", "horizon", "horizon.yml"],
                     ["lib", "themes", "minimalist"],
                     ["lib", "themes", "minimalist", "minimalist.yml"]]

    ThemeInstalation.any_instance.stub(:split_files).with(@themes_path).and_return(@splited_files)
  end

  it "split themes files dir" do
    split_files = ThemeInstalation.new.split_files(@themes_path)
    expect(split_files).to eq(@splited_files)
  end

  it "list uniques themes of splited list files" do
    themes_path = "lib/themes/**/*"
    split_files = ThemeInstalation.new.split_files(themes_path)
    list_themes = ThemeInstalation.new.list_themes(split_files)
    expect(list_themes).to eq(["horizon", "minimalist"])
  end
end