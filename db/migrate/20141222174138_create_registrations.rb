class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :gym, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
