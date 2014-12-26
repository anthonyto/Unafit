class AddZipToGyms < ActiveRecord::Migration
  def change
    add_column :gyms, :zip, :string
  end
end
