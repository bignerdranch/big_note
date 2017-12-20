class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def new
  	@note = Note.new
  end 

  def create
  	Note.create(note_params)
  	redirect_to notes_path
  end 

  def edit 
    @note = Note.find(params[:id])
  end 

  def update 
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to edit_note_path(@note)
    end
  end 

  private 

  def note_params
  	params.require(:note).permit(:title, :body)
  end

end
