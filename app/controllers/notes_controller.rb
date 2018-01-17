class NotesController < ApplicationController

  def create
    mouse = Mouse.find_by(lab_id: params[:lab_id])
    @note = Note.new(user: current_user, mouse: mouse, content: note_params[:content])
      if @note.save
        create_notification(@note)
      else
        flash[:error] = "Something went wrong. Try again."
      end
    redirect_back(fallback_location: mouse_path(mouse.lab_id))
  end

  private
      def note_params
        params.require(:note).permit(:content)
      end

      def create_notification(note)
        @note.mouse.protocol.users.each do |user|
          Notification.create!(user: user, note: @note)
        end
      end
end
