class NotesController < ApplicationController
  def index
    # render plain: params.inspect
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
    # @note = Note.create(note_params)

    # respond_to do |format|
    #     if  @note.save
    #       # if verify_recaptcha(model: @pay) && @pay.save
    #       format.html { redirect_to  notes_path  }
    #       format.json { render :index, status: :created, location: @notes }
    #     else
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @note.errors, status: :unprocessable_entity }
    #     end
    # end
  end
  # def show
  #   @note = Note.find(params[:id])
  # end
  # def edit
  #   @note = Note.find(params[:id])
  # end
  # def update
  #   @note = Note.find(params[:id])

  #   if @note.update(note_params)
  #     redirect_to @note
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end
  # def delete
  #   @note=Note.new(title: params[:note][:title], description: params[:note][:description] )
  #   if @note.save
  #     redirect_to root_path
  #   end 
  # end

  def destroy
    @note = Note.find(params[:id])
    @bin = Bin.new
    if @note.destroy
     @bin << @note
     redirect_to trash_path, :notice => "Successfully note is added to bin."
    else 
     redirect_to new_note_path, :notice => "Failed to delete a note."
    end
  end
  
 


end

private

def note_params
  params.require(:note).permit(:title, :description)
end
