class ChangeTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :shells, :type, :shell_type
    rename_column :engines, :type, :engine_type
    rename_column :tires, :type, :tire_type
    rename_table :car_races, :carraces
  end
end
