class MiceController < ApplicationController
  def index
    Rails.cache.fetch(:all_mice) do
      @mice = Mouse.all
    end
  end

  def show
    mouse = Mouse.find_by(original_id: params[:id])
    @presenter ||= MouseDataPresenter.new(mouse)
  end
end
