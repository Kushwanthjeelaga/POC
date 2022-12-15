class BinsController < ApplicationController
  def delete
    @trash=Bin.new(title: params[:note][:title], description: params[:note][:description])
    if @trash.save
      redirect_to trash_path
      flash[:notice]="all notes deleted successfully"
    end 
  end
  def trash
    @trash = Bin.all
  end   

  def destroy    
    @bin = Bin.destroy_all
    redirect_to trash_path
  end
end
