class Admin::PagesController < Admin::ApplicationController
  
  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
  end
end
