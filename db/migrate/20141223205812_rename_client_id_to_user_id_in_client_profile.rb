class RenameClientIdToUserIdInClientProfile < ActiveRecord::Migration
  def change
    rename_column :client_profiles, :client_id, :user_id
  end
end
