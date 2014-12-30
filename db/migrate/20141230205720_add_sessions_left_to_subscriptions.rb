class AddSessionsLeftToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :sessions_left, :integer
  end
end
