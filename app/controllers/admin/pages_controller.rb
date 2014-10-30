class Admin::PagesController < Admin::ApplicationController
  before_filter :find_page, only: [:edit, :update]

  def index
    @pages = Page.all
  end

  def new
    @page = Page.new
    selected_collection
  end

  def edit
    selected_collection
  end

  def create
    if Page.create(page_params)
      redirect_to admin_pages_path, flash: { success: "Page created with success!" }
    else
      render action: 'new'
    end
  end

  def update
    if @page.update_attributes(page_params)
      redirect_to edit_admin_page_path(@page), flash: { success: "Page updated with success!" }
    else
      render action: 'edit'
    end
  end

  private
    def find_page
      @page = Page.find(params[:id])
    end

    def selected_collection
      @collection = Page.all.to_a - [@page]
    end

    def page_params
      params.require(:page).permit(:title, :content, :mother)
    end
end
