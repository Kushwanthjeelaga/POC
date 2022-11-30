class RemoveTrashFkFromNotes < ActiveRecord::Migration[7.0]
  def change
    if foreign_key_exists?(:notes, :trashes)
      remove_foreign_key :notes, :trashes
    end 
  end
end
