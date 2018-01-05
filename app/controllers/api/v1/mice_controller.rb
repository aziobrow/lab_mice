class Api::V1::MiceController < ActionController::API

  def index
    render json: Mouse.all
  end

  def show
    render json: Mouse.find_by(original_id: params[:original_id])
  end
end
