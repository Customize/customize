class ThemeInstalation

  def split_files(dir)
    splited_files = []
    files = Dir.glob(dir)

    files.each do |f|
      splited_files << f.split("/")
    end

    splited_files
  end

  def list_themes(splited_files)
    themes = []
    splited_files.each do |f|
      themes.push(f[2])
    end
    themes.uniq    
  end
end