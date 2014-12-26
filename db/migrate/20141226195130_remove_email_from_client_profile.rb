class RemoveEmailFromClientProfile < ActiveRecord::Migration
  def change
    remove_column :client_profiles, :email, :string
  end
end
