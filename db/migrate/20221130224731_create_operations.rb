class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :description
      t.belongs_to :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end
