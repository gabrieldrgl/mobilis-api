class AddVanToAddresses < ActiveRecord::Migration[7.1]
  def change
    add_reference :addresses, :van, null: true, foreign_key: true
  end
end
