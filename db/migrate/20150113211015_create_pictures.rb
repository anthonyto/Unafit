class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file_name
      t.belongs_to :gym, index: true

      t.timestamps
    end
  end
end
