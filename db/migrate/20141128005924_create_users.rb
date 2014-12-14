class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :city
      t.string :state
      t.string :street
      t.string :zip
      t.decimal :lat
      t.decimal :lng
      t.string :type
      t.integer :number_of_sessions

      t.timestamps
    end
  end
end
