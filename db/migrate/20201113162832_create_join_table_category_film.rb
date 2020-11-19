class CreateJoinTableCategoryFilm < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_films, id: false do |t|
      t.belongs_to :category
      t.belongs_to :film
    end
  end
end
