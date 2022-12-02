class NotesController < ApplicationController
  def index
    @notes = Note.all.order("created_at ASC")
  end
  def new
    @note = Note.new 
  
  end

  def create
    @note = Note.new(title: params[:note][:title], description: params[:note][:description] )
    if @note.save
      redirect_to root_path
    end 

  end
  def show
    @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    @bin = Bin.new
    if @note.destroy
     redirect_to trash_path, :notice => "Successfully note is added to bin."
    else 
     redirect_to new_note_path, :notice => "Failed to delete a note."
    end
  end
end

