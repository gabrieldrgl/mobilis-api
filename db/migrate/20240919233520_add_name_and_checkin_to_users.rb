class AddNameAndCheckinToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :checkin, :boolean, default: false
  end
end
