require "yaml"

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

  def self.save_themes(themes_info)
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
