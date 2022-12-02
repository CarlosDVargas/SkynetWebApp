class AddIdNumberToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :id_number, :string, null: false
  end
end
