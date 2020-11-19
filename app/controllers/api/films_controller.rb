class Api::FilmsController < ApplicationController
  def index
    # films = Film.all
    #
    # if films.length > 0
    #   render json: { films: films}
    # else
    #   render json: { films: 'no films'}
    # end

    # render json: { action: action_name}
  end

  def create
    render json: { action: action_name}
  end

  def show
    render json: { action: action_name}
  end

  def update
    render json: { action: action_name}
  end

  def destroy
    render json: { action: action_name}
  end
end
