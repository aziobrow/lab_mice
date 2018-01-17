class NotesController < ApplicationController

  def create
    mouse = Mouse.find_by(lab_id: params[:lab_id])
    @note = Note.create!(user: current_user, mouse: mouse, content: note_params[:content])

    redirect_back(fallback_location: mouse_path(mouse.lab_id))
  end

  private
      def note_params
        params.require(:note).permit(:content)
      end
end
