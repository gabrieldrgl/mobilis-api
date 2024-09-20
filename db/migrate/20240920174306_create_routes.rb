class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.datetime :end_time
      t.integer :status, default: 0
      t.references :van, null: false, foreign_key: true

      t.timestamps
    end
  end
end
