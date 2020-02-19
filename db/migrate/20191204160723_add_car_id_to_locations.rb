class AddCarIdToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :car_id, :integer
    
  end
end
