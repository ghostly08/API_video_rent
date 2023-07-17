class MoviesController < ApplicationController

  def index
    @movies = Rails.cache.fetch('movies', expires_in: 12.hours) do
      Movie.order(created_at: :desc)
    end
    render json: @movies
  end

  def show
    @movie = Movie.find(params[:id])
    render json: @movie
  end

end
