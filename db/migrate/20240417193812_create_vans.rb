class CreateVans < ActiveRecord::Migration[7.1]
  def change
    create_table :vans do |t|
      t.string :license_plate
      t.string :color
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
