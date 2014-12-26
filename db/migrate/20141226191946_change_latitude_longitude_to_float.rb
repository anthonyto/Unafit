class ChangeLatitudeLongitudeToFloat < ActiveRecord::Migration
  def change
    change_column :client_profiles, :latitude, :float
    change_column :client_profiles, :longitude, :float
    change_column :gyms, :latitude, :float
    change_column :gyms, :longitude, :float
  end
end
