class AnalyticsController < ApplicationController

  def index
  end

  def show
    @chart_type = params["chart_type"]
    @mice_one = Mouse.where(diet: 'control').limit(50)
    @mice_two = Mouse.where(diet: 'rapamycin').limit(50)


  end

  private
    def chart_params
      params.permit
    end
end
