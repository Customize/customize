class Admin::ThemesController < Admin::ApplicationController

  def index
    @themes = Theme.all
  end
end
