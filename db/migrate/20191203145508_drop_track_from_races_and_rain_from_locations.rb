class DropTrackFromRacesAndRainFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :rain
    remove_column :races, :track
  end
end
