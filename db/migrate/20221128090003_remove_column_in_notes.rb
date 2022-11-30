class RemoveColumnInNotes < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :trash_id, :integer
  end
end
