class CreateClientProfiles < ActiveRecord::Migration
  def change
    create_table :client_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :city
      t.string :state
      t.string :street
      t.string :zip
      t.string :lat
      t.string :lng
      t.integer :number_of_sessions

      t.timestamps
    end
  end
end
