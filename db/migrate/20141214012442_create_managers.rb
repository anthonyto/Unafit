class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :gym_name

      t.timestamps
    end
  end
end
