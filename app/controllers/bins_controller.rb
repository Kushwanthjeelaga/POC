class BinsController < ApplicationController
  def trash
    @trash = Bin.all
  end   
  def delete
    @trash=Bin.new(title: params[:note][:title], description: params[:note][:description])
    if @trash.save
      redirect_to trash_path
      flash[:notice]="all notes deleted successfully"
    end 
  end
  def destroy
    Bin.destroy_all
    redirect_to trash_path
  end
end
