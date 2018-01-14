class MiceController < ApplicationController

  def new
    @mouse = Mouse.new
  end

  def create
    @mouse = Mouse.new(mouse_params)
    if @mouse.save
      flash[:success] = "Mouse ##{@mouse.original_id} successfully added to the database."
      redirect_to mouse_path(@mouse.original_id)
    else
      flash[:error] = "Something went wrong. Try again."
      render :new
    end
  end

  def edit
    @mouse = Mouse.find(params[:id])
  end

  def update
    @mouse = Mouse.update(params[:id], mouse_params)
    redirect_to mouse_path(@mouse.original_id)
  end

  def index
    @mice = Mouse.all
  end

  def show
    mouse = Mouse.find_by(original_id: params[:id])
    @presenter ||= MouseDataPresenter.new(mouse)
  end

private
  def date_of_birth
    Date.civil(params["raw_date_of_birth"]["date_of_birth(1i)"].to_i,
              params["raw_date_of_birth"]["date_of_birth(2i)"].to_i,
              params["raw_date_of_birth"]["date_of_birth(3i)"].to_i)
  end

  def experiment_start_date
    Date.civil(params["raw_experiment_start_date"]["experiment_start_date(1i)"].to_i,
              params["raw_experiment_start_date"]["experiment_start_date(2i)"].to_i,
              params["raw_experiment_start_date"]["experiment_start_date(3i)"].to_i)
  end

  def mouse_params
    params[:mouse][:date_of_birth] = date_of_birth
    params[:mouse][:experiment_start_date] = experiment_start_date
    params.require(:mouse).permit(:original_id, :trisomic, :diet, :color, :sex, :date_of_birth, :experiment_start_date, :group_number)
  end

end
