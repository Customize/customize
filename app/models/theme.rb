class Theme
  include Mongoid::Document

  def self.split_files
    splited_files = []
    files = Dir.glob("lib/themes/**/*")

    files.each do |f|
      splited_files << f.split("/")
    end

    splited_files
  end

  def self.files
    arrange = {themes: [], about: []}
    split_files.each do |f|
      arrange[:themes] << f[2]
      arrange[:about]  << f[3]
    end

    filter_data(arrange)
  end

  def self.filter_data(arrange)
    arrange = {themes: arrange[:themes].uniq, about: arrange[:about].compact} 
  end
end
