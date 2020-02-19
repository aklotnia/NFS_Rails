class CreateCarRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :car_races do |t|
      t.integer :car_id
      t.integer :race_id
    end
  end
end
