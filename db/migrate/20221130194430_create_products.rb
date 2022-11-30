class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.decimal :price, precision: 24, scale: 2
      t.decimal :cost, precision: 24, scale: 2
      t.text :description
      t.timestamps
    end
  end
end
