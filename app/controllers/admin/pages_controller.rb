class Admin::PagesController < Admin::ApplicationController

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
    selected_collection
  end

  def edit
    @page = Page.find(params[:id])
    selected_collection
  end

  def create
    if Page.create(page_params)
      redirect_to admin_pages_path, flash: { error: "Page created with success" }
    else
      render action: 'new'
    end
  end

  private
    def page_params
      params.require(:page).permit(:title, :content)
    end

    def selected_collection
      @collection = Page.all.to_a - [@page]
    end
end
