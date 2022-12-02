class BinsController < ApplicationController
  def trash
    @trash = Bin.all
  end   
  def delete
    @trash=Bin.new(title: params[:note][:title], description: params[:note][:description])
    if @trash.save
      redirect_to trash_path
    end 
  end
end

