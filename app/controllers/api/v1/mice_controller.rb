class Api::V1::MiceController < ActionController::API

  def index
    render json: Mouse.all
  end

  def show
    render json: Mouse.find_by(lab_id: params[:lab_id])
  end
end
