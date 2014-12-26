class RenameLatLngToLatitudeLongitude < ActiveRecord::Migration
  def change
    rename_column :client_profiles, :lat, :latitude
    rename_column :client_profiles, :lng, :longitude
    rename_column :gyms, :lat, :latitude
    rename_column :gyms, :lng, :longitude
    
  end
end
