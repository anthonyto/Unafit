class AddClientIdToClientProfile < ActiveRecord::Migration
  def change
    add_column :client_profiles, :client_id, :integer
    add_index :client_profiles, :client_id
  end
end
