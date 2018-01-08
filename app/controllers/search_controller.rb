class SearchController < ApplicationController
  def show
    redirect_to mouse_path(id: params[:search])
  end
end
