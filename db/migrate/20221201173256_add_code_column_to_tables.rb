class AddCodeColumnToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :code, :string, null: false, unique: true
    add_column :operations, :code, :string, null: false, unique: true
    add_column :routes, :code, :string, null: false, unique: true
    add_column :batches, :code, :string, null: false, unique: true
    add_column :countries, :code, :string, null: false, unique: true
  end
end
