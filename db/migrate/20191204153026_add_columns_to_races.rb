class AddColumnsToRaces < ActiveRecord::Migration[6.0]
  def change
    add_column :races, :car_id, :integer
    add_column :races, :win, :boolean
    remove_column :races, :race_winner_id
    
  end
end
