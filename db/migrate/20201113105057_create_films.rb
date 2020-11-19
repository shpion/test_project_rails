class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :title, null: false
      t.text :description
      t.timestamps
      t.timestamp :deleted_at
    end
  end
end
