class FilterController < ApplicationController
  def index
    if query_params[:user]
      @mice = MousePresenter.new(query_params).tracked_mice(current_user)
      @filters = query_params.except(:user).values
    else
      @mice = MousePresenter.new(query_params).mice
      @filters = query_params.values
    end
  end

private
  def query_params
    params.permit(:diet, :ploidy, :user, :color, :sex, :harvest_status, :treatment_status)
  end
end
