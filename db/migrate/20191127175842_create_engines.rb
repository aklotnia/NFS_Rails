class CreateEngines < ActiveRecord::Migration[6.0]
  def change
    create_table :engines do |t|
      t.string :name
      t.text :description
      t.string :type 
      t.integer :acceleration
      t.integer :speed
      t.integer :handling
      t.integer :weight
      t.integer :reliability
    end
  end
end
