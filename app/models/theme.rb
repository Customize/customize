class Theme
  include Mongoid::Document

  def self.read_files
    splited_files = []
    files = Dir.glob("lib/themes/**/*")

    files.each do |f|
      splited_files << f.split("/")
    end

    splited_files
  end

  def self.arrange_files
    arrange = {themes: [], about: []}
    read_files.each do |f|
      arrange[:themes] << f[2]
      arrange[:about]  << f[3]
    end

    arrange = {themes: arrange[:themes].uniq, about: arrange[:about].compact}
  end

  def self.add_theme

  end
end
