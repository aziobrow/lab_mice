class FilterController < ApplicationController
  def index
    @mice = MousePresenter.new(query_params).mice
    @filters = query_params.values
  end

private
  def query_params
    params.permit(:diet, :trisomic)
  end
end
