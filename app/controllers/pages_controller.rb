class PagesController < ApplicationController
  before_filter :fetch_page, only: [:show]

  def show
    if @page.posts.size >= 1
      @posts = @page.posts
    end
  end

  private
    def fetch_page
      @page = Page.find(params[:id])
    end
end
