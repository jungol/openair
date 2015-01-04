class NotesController < ApplicationController
  def create    
    note = Note.find_by(copy_id: params[:note][:copy_id], location: params[:note][:location])
    if note
      note.update_attributes(note_params)
    else
      Note.create(note_params)
    end
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  def update
  end

  private

    def note_params
      params.require(:note).permit(:copy_id, :location, :content)
    end
end
