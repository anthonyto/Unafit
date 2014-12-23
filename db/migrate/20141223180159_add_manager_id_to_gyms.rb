class AddManagerIdToGyms < ActiveRecord::Migration
  def change
    add_column :gyms, :manager_id, :integer
    add_index :gyms, :manager_id
  end
end
