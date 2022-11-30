class AddBinReferenceToNote < ActiveRecord::Migration[7.0]
  def change
    add_reference :notes, :bin,  foreign_key: true
  end
end
