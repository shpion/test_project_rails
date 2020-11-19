class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true
      t.string :password
      t.integer :type_mask, default: 1, null: false
      t.timestamps
      t.timestamp :deleted_at
    end
  end
end
