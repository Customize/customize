require "yaml"
require "./lib/customize/theme_instalation"

class Theme
  include Mongoid::Document
  mount_uploader :file, FileUploader


  field :name,        type: String
  field :description, type: String
  field :author,      type: String
  field :site,        type: String
  field :email,       type: String
  field :version,     type: String

  def self.get_saved_themes
    Theme.all.map { |t| t.name }
  end

  def self.save_themes
    themes_path = "lib/themes/**/*"
    splited_files = ThemeInstalation.new.split_files(themes_path)
    listed_themes = ThemeInstalation.new.list_themes(splited_files)
    themes_info = ThemeInstalation.new.read_info(listed_themes)

    themes_info.each do |k, v|
      unless get_saved_themes.include? k[:name]
        theme = Theme.create(
          name:        k[:name],
          description: k[:description],
          author:      k[:author],
          site:        k[:site],
          email:       k[:email],
          version:     k[:version])
      end
    end
  end
end
