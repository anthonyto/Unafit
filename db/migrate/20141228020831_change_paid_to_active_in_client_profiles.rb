class ChangePaidToActiveInClientProfiles < ActiveRecord::Migration
  def change
    rename_column :client_profiles, :paid, :active
  end
end
