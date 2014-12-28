class AddPaymentAttributesToClientProfile < ActiveRecord::Migration
  def change
    add_column :client_profiles, :last_payment, :datetime
    add_column :client_profiles, :number_of_payments, :integer, :default => 0
  end
end
