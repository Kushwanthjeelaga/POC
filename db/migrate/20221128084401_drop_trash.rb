class DropTrash < ActiveRecord::Migration[7.0]
  def change
    drop_table :trashes, if_exists: true
  end
end
