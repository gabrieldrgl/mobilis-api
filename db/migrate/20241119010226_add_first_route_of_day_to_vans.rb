class AddFirstRouteOfDayToVans < ActiveRecord::Migration[7.1]
  def change
    add_column :vans, :first_route_of_day, :boolean, default: true, null: false
  end
end
