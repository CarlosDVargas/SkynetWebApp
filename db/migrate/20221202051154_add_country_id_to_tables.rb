class AddCountryIdToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :batches, :country_id, :integer, null: false
    add_column :operations, :country_id, :integer, null: false
    add_foreign_key :batches, :countries, column: :country_id
    add_foreign_key :operations, :countries, column: :country_id
  end
end
