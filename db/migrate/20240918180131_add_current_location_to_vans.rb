class AddCurrentLocationToVans < ActiveRecord::Migration[7.1]
  def change
    add_column :vans, :current_location, :string
  end
end
