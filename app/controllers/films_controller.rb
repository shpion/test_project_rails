class FilmsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])

  end

  def create
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
end
