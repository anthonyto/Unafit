class ChangeManagerIdToUserIdInGyms < ActiveRecord::Migration
  def change
    rename_column :gyms, :manager_id, :user_id
  end
end
