class AddColToBin < ActiveRecord::Migration[7.0]
  def change
    drop_table :buckets, if_exists: true
  end
end
