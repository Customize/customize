require "./lib/customize/theme/settings"

describe Customize::Theme::Settings do
  before :each do
    @themes_path = "lib/themes/**/*"
    @splited_files = [["lib", "themes", "horizon"],
                     ["lib", "themes", "horizon", "horizon.yml"],
                     ["lib", "themes", "minimalist"],
                     ["lib", "themes", "minimalist", "minimalist.yml"]]

    Customize::Theme::Settings.any_instance.stub(:split_files).with(@themes_path).and_return(@splited_files)    
    @files = Customize::Theme::Settings.new.split_files(@themes_path)
  end

  it "list uniques themes of splited list files" do
    list_themes = Customize::Theme::Settings.new.list_themes(@files)
    expect(list_themes).to eq(["horizon", "minimalist"])
  end  
end
