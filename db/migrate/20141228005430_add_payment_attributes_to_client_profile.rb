class AddPaymentAttributesToClientProfile < ActiveRecord::Migration
  def change
    add_column :client_profiles, :last_date_paid, :datetime
    add_column :client_profiles, :times_paid, :integer, :default => 0
  end
end
