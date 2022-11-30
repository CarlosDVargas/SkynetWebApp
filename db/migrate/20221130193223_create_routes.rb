class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.integer :country_id
      t.text :description
      t.timestamps
    end

    add_foreign_key :routes, :countries, column: :country_id
  end


end
