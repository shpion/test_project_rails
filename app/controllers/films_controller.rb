class FilmsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])

  end

  def create
    @category = Category.find(params[:category_id])
    @film = Film.new(film_params)

    categories = params[:categories]
    categories = categories.split(",")

    clear_cat_names = []
    categories.each do |category|
      clear_cat_names << category.strip.capitalize
    end

    cat_objects = Category.where(name: clear_cat_names)
    if cat_objects.length > 0
      cat_objects.each do |cat_object|
        @film.categories << cat_object
      end
    end

    if @film.save
      redirect_to category_films_path(@category), notice: "Film was successfully added."
    else
      render :action => "new"
    end
  end

  def new
    @film = Film.new
  end

  def edit
  end

  def show
    @film = Film.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def film_params
    params.require(:film).permit(:title, :description)
  end
end
