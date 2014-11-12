class Admin::ThemesController < Admin::ApplicationController

  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end

  def create
  end
end
