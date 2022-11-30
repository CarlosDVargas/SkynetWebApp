class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.text :description
      t.belongs_to :country, null: false, foreign_key: true
      t.timestamps
    end
  end
end
