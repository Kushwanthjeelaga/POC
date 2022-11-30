class AddTrashRefToNotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :trash, foreign_key: true
  end
end
