class SavedNotesController < ApplicationController
  before_action :set_note

  def create
    saved_note = SavedNote.new(user: current_user, note: @note)
    if saved_note.save
      flash[:success] = "Note added to your dashboard"
    else
      flash[:error] = "Oops, something went wrong. Try again."
    end
    redirect_back(fallback_location: mouse_path(@note.mouse.lab_id))
  end

  def destroy
    saved_note = SavedNote.where("user_id = ? AND note_id = ?", current_user.id, @note.id)[0]
    saved_note.destroy
    flash[:success] = "Note removed from dashboard"
    redirect_back(fallback_location: user_dashboard_path)
  end

  private
      def set_note
        @note = Note.find(params[:note_id])
      end
end
