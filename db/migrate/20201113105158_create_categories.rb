class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, unique: true, null: false
      t.integer :films_count, default: 0, null: false
      t.timestamps
    end
  end
end
