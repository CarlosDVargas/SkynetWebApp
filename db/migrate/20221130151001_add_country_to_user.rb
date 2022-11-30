class AddCountryToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_connected_country, :integer
  end
end
