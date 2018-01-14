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
  def mouse_params
    params[:mouse][:date_of_birth] = "#{params["date_of_birth_unformatted"]["date_of_birth(2i)"]}/#{params["date_of_birth_unformatted"]["date_of_birth(3i)"]}/#{params["date_of_birth_unformatted"]["date_of_birth(1i)"]}"
    params[:mouse][:experiment_start_date] = "#{params["experiment_start_date_unformatted"]["experiment_start_date(2i)"]}/#{params["experiment_start_date_unformatted"]["experiment_start_date(3i)"]}/#{params["experiment_start_date_unformatted"]["experiment_start_date(1i)"]}"
    params.require(:mouse).permit(:original_id, :trisomic, :diet, :color, :sex, :date_of_birth, :experiment_start_date, :group_number)
  end

end
