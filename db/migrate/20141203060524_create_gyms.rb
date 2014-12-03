class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :city
      t.string :state
      t.string :street
      t.decimal :lat
      t.decimal :lng
      t.int :2_gym_passes
      t.int :3_gym_passes
      t.int :4_gym_passes
      t.string :status
      t.text :description
      t.string :link
      t.string :profile_image
      t.string :logo_image
      t.boolean :showers
      t.text :classes
      t.text :reservation_policy

      t.timestamps
    end
  end
end
