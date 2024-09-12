class AddVanToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :van, foreign_key: true
  end
end
