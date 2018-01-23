class AnalyticsController < ApplicationController

  def index
  end

  def show
    @mice = MousePresenter.new(chart_params).mice
  end

  private
    def chart_params
      params.permit
    end
end
