class Theme
  include Mongoid::Document

  field :folders, type: Hash
  field :author,  type: String
  field :email,   type: String
  field :site,    type: String
  field :version, type: String

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
end
