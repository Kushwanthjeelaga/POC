class DropTableBins < ActiveRecord::Migration[7.0]
  def change
    drop_table :bins, if_exists: true
  end
end
