class RenameRegistrationsToSubscriptions < ActiveRecord::Migration
  def change
    rename_table :registrations, :subscriptions
  end
end
