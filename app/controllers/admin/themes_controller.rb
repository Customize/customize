class Admin::ThemesController < Admin::ApplicationController

  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
    @file = FileUploader.new
  end

  def create
    file = FileUploader.new
    file.cache!(params[:theme][:file])

    file = file.current_path
    destination = "./lib/themes/"

    Zip::File.open(file) { |zip_file|
     zip_file.each { |f|
       f_path=File.join(destination, f.name)
       FileUtils.mkdir_p(File.dirname(f_path))
       zip_file.extract(f, f_path) unless File.exist?(f_path)
     }
    }

    Theme.save_themes

    redirect_to admin_themes_path
  end
end
