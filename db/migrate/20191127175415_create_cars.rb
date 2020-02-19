class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :color
      t.integer :shell_id
      t.integer :engine_id
      t.integer :tire_id
      t.integer :user_id
    end
  end
end
