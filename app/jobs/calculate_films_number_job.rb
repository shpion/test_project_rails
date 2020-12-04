class CalculateFilmsNumberJob < ApplicationJob
  queue_as :default

  def perform
    categories = Category.all
    categories.each do |category|
      category.films_count = category.films.count
      category.save
    end
  end
end
