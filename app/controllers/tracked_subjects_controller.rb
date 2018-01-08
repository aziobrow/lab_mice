class TrackedSubjectsController < ApplicationController
  before_action :set_mouse

  def create
    @tracked_subject = TrackedSubject.new(user: current_user, mouse: @mouse)
    if @tracked_subject.save
      flash[:success] = "Mouse ##{@mouse.original_id} added to your dashboard"
    else
      flash[:error] = "Oops, something went wrong. Try again."
    end
    redirect_back(fallback_location: mouse_path(@mouse.original_id))
  end

  def destroy
    subject = TrackedSubject.where("user = ? AND mouse = ?", current_user, @mouse )
    subject.destroy
    flash[:success] = "Mouse ##{subject.mouse.original_id} succesfully untracked"
    redirect_back(fallback_location: user_dashboard_path(current_user))
  end


  private
      def set_mouse
        @mouse = Mouse.find_by(original_id: params[:original_id])
      end
end
