class MoviesController < ApplicationController

  def index
    @movies = Movie.order(created_at: :desc)
    render json: @movies
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie
  end

end
