class Admin::ThemesController < Admin::ApplicationController

  def index
    @themes = Theme.files
  end
end
