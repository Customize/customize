class Admin::ThemesController < Admin::ApplicationController

  def index
    @themes = Theme.all
  end

  def new
    
  end
end
