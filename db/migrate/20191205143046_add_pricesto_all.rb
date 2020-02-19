class AddPricestoAll < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cash, :integer
    add_column :shells, :cost, :integer
    add_column :engines, :cost, :integer
    add_column :tires, :cost, :integer
  end
end
