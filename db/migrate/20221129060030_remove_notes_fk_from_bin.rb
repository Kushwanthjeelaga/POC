class RemoveNotesFkFromBin < ActiveRecord::Migration[7.0]
  def change
    if foreign_key_exists?(:notes, :bins)
      remove_foreign_key :notes, :bins
    end
  end
end
