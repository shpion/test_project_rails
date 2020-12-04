class FilmsController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id]) or not_found
  end

  def show
    @category = Category.find_by(id: params[:category_id])  or not_found
    @film = Film.find_by(id: params[:id]) or not_found
  end

  def new
    @film = Film.new
  end

  def create
    @film = add_categories_to_film(Film.new(film_params))

    if @film.save
      CalculateFilmsNumberJob.perform_now
      redirect_to categories_path, notice: "Film was successfully added."
    else
      render :action => "new"
    end
  end

  def edit
    @category = Category.find_by(id: params[:category_id]) or not_found
    @film = Film.find_by(id: params[:id]) or not_found

    @categories = ""
    @film.categories.each do |category|
      @categories = @categories + category.name + ","
    end
  end

  def update
    category = Category.find_by(id: params[:category_id]) or not_found
    @film = Film.find_by(id: params[:id]) or not_found

    @film = add_categories_to_film(@film)

    if @film.update_attributes(film_params)
      CalculateFilmsNumberJob.perform_now
      redirect_to category_films_path(category), notice: "Film was successfully edited."
    else
      render :action => "edit"
    end
  end

  def destroy
    category = Category.find_by(id: params[:category_id]) or not_found
    film = Film.find_by(id: params[:id]) or not_found

    film.categories.delete(category)

    if film.categories.count == 0
      film.destroy
    end

    CalculateFilmsNumberJob.perform_now

    redirect_to category_films_path(category), notice: "Film was successfully deleted."
  end

  private

  def film_params
    params.require(:film).permit(:title, :description)
  end

  def add_categories_to_film(film)
    categories = params[:categories]
    categories = categories.split(",")

    clear_cat_names = []
    categories.each do |cat|
      clear_cat_names << cat.strip.downcase.capitalize
    end

    cat_objects = Category.where(name: clear_cat_names)
    if cat_objects.length > 0
      cat_objects.each do |cat_object|
        if !film.categories.include?(cat_object)
               film.categories << cat_object
        end
      end
    end

    film
  end
end
