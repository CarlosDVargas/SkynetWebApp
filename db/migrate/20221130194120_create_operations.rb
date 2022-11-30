class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.integer :route_id
      t.text :description
      t.timestamps
    end

    add_foreign_key :operations, :routes, column: :route_id
  end
end
