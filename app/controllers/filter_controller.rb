class FilterController < ApplicationController
  def index
    @mice = apply_scopes(Mouse).all
  end


private
  def query_params
    params.permit(:diet, :trisomic)
  end
end
