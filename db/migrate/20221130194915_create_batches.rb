class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.integer :product_id
      t.integer :operation_id
      t.string :current_operation, length: 5
      t.integer :units
      t.timestamps
    end

    add_foreign_key :batches, :products, column: :product_id
    add_foreign_key :batches, :operations, column: :operation_id
  end
end
