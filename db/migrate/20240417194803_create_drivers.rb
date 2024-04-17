class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.references :company, null: false, foreign_key: true
      t.references :van, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :drivers_license

      t.timestamps
    end
  end
end
