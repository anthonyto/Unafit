class RemoveAttributesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :phone_number
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :street
    remove_column :users, :zip
    remove_column :users, :lat
    remove_column :users, :lng
    remove_column :users, :type
    remove_column :users, :number_of_sessions
  end
end
