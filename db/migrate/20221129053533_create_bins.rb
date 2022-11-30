class CreateBins < ActiveRecord::Migration[7.0]
  def change
    create_table :bins do |t|

      t.timestamps
    end
  end
end
