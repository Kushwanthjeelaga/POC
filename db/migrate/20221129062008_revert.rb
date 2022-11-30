class Revert < ActiveRecord::Migration[7.0]
  def change
    remove_column :notes, :bin_id, :integer
  end
end
