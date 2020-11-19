class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :comment
      t.timestamps
      t.timestamp :deleted_at
      t.belongs_to :film, index: true
      t.belongs_to :user, index: true
    end
  end
end
