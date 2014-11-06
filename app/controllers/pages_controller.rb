class PagesController < ApplicationController

  def show
    @page = Page.find(params[:id])

    if @page.posts.size >= 1
      @posts = @page.posts
    end
  end
end
