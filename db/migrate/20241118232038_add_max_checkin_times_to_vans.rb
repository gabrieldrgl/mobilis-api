class AddMaxCheckinTimesToVans < ActiveRecord::Migration[7.1]
  def change
    add_column :vans, :max_checkin_time_away, :string
    add_column :vans, :max_checkin_time_return, :string
  end
end
