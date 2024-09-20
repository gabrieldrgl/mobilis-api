class CreateInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :invites do |t|
      t.string :token
      t.references :company, null: false, foreign_key: true
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
