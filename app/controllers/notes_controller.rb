class NotesController < ApplicationController
  before_action :checking_csv_params, only: %i[create]
  require 'csv'
  def index
    @notes = Note.all
    
  end
  def new
    @note = Note.new 
  end

  def create
    
    @note = Note.new(title: params[:note][:title], description: params[:note][:description] )

      respond_to do |format|
        format.html {
        if @note.save
          redirect_to notes_path 
          flash[:notice] = "Successfully note is added to home."
        else
          redirect_to notes_path
        end 
        }
        format.csv  {

        }
      end      
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(title: params[:note][:title], description: params[:note][:description])
      redirect_to note_path
    else
      render :edit, status: :unprocessable_entity
    end
  end



  def download


  end

  def destroy
    @note = Note.find(params[:id])
    @bin = Bin.new
    if @note.destroy
     redirect_to trash_path
     flash[:notice] = "Successfully note is added to bin."
    else 
     redirect_to new_note_path 
     flash[:notice] = "Failed to delete a note."
    end
  end
  private 
   def checking_csv_params
    unless params[:note][:title].present? || params[:note][:description]
      redirect_to new_note_path
      flash[:notice]=" title or description is empty, please fill your data..."
    end
   end
end


