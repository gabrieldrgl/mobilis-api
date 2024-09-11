class AddRolesAndCompanyToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer
    add_reference :users, :company, foreign_key: true
  end
end
