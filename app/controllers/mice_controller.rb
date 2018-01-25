class MiceController < ApplicationController

  def new
    @mouse = Mouse.new
  end

  def create
    @mouse = Mouse.new(mouse_params)
    if @mouse.save
      flash[:success] = "Mouse ##{@mouse.lab_id} successfully added to the database."
      redirect_to mouse_path(@mouse.lab_id)
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
    redirect_to mouse_path(@mouse.lab_id)
  end

  def index
    if params[:retired]
      @mice = Mouse.where(active_status: 'retired')
    else
      @mice = Mouse.all
    end
  end

  def show
    if params['notification_id']
      notification = Notification.find(params['notification_id'])
      notification.update(read: true)
    end
    mouse = Mouse.find_by(lab_id: params[:id])
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
    params.require(:mouse).permit(:lab_id, :ploidy, :diet, :color, :sex, :date_of_birth, :experiment_start_date, :group_number, :protocol_id, :harvest_status, :treatment_status, :active_status)
  end

end
