class AnalyticsController < ApplicationController

  def index
  end

  def show
    @chart_type = params["chart_type"]
    @data = Mouse.group(params["attribute"]).count
  end

  private
    def chart_params
      params.permit
    end
end
