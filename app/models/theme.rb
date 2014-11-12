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

  def self.read_files
    splited_files = []
    files = Dir.glob("lib/themes/**/*")

    files.each do |f|
      splited_files << f.split("/")
    end

    splited_files
  end

  def self.list_themes
    themes = []
    read_files.each do |f|
      themes.push(f[2])
    end
    themes.uniq
  end

  def self.read_info
    themes = []
    list_themes.each do |t|
      file = YAML.load_file("lib/themes/#{t}/about.yml")
      themes.push({name: file["name"], description: file["description"], author: file["author"], site: file["site"], email: file["email"], version: file["version"]})
    end
    themes
  end

  def self.save_themes
    read_info.each do |k, v|
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
