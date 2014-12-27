class AddPaidToClientProfile < ActiveRecord::Migration
  def change
    add_column :client_profiles, :paid, :boolean, :default => false
  end
end
