class RemoveFirstNameAndLastNameFromClientProfile < ActiveRecord::Migration
  def change
    remove_column :client_profiles, :first_name, :string
    remove_column :client_profiles, :last_name, :string
  end
end
