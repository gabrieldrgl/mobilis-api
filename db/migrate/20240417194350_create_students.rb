class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.boolean :checkin
      t.references :van, null: false, foreign_key: true
      t.string :home_address
      t.string :destination_address
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
