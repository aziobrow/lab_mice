class MiceController < ApplicationController
  def index
    @mice = Mouse.all
  end

  def show
    @mouse = Mouse.find_by(original_id: params[:id])
  end
end
