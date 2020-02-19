class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.integer :track
      t.integer :location_id
      t.integer :race_winner_id
    end
  end
end
