require "yaml"

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

  def read_info(list_themes)
    themes = []
    list_themes.each do |t|
      file = YAML.load_file("lib/themes/#{t}/about.yml")
      themes.push({name: file["name"], description: file["description"], author: file["author"], site: file["site"], email: file["email"], version: file["version"]})
    end
    themes
  end
end
