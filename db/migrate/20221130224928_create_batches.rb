class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :operation, null: false, foreign_key: true
      t.string :current_operation
      t.integer :units

      t.timestamps
    end
  end
end
