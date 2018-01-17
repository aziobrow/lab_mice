class TrackedSubjectsController < ApplicationController
  before_action :set_mouse

  def create
    @tracked_subject = TrackedSubject.new(user: current_user, mouse: @mouse)
    if @tracked_subject.save
      flash[:success] = "Mouse ##{@mouse.lab_id} added to your dashboard"
    else
      flash[:error] = "Oops, something went wrong. Try again."
    end
    redirect_back(fallback_location: mouse_path(@mouse.lab_id))
  end

  def destroy
    subject = TrackedSubject.where("user_id = ? AND mouse_id = ?", current_user.id, @mouse.id )[0]
    subject.destroy
    flash[:success] = "Mouse ##{subject.mouse.lab_id} successfully untracked"
    redirect_back(fallback_location: user_dashboard_path(current_user))
  end


  private
      def set_mouse
        @mouse = Mouse.find_by(lab_id: params[:lab_id])
      end
end
