class NotesController < ApplicationController

  def create
    mouse = Mouse.find_by(original_id: params[:original_id])
    @note = Note.create!(user: current_user, mouse: mouse, content: note_params[:content])

    redirect_back(fallback_location: mouse_path(mouse.original_id))
  end

  private
      def note_params
        params.require(:note).permit(:content)
      end
end
