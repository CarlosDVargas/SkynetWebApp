class SetNullRouteId < ActiveRecord::Migration[7.0]
  def change
    change_column_null :operations, :route_id, true
  end
end
