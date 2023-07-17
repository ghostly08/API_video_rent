class ContentsController < ApplicationController

  def index
    @movies = Rails.cache.fetch('movies', expires_in: 12.hours) do
      Movie.order(created_at: :desc)
    end

    @seasons = Rails.cache.fetch('seasons', expires_in: 12.hours) do
      Season.includes(:episodes).order(created_at: :desc).map do |season|
        season.as_json(include: :episodes)
      end
    end

    @contents = (@movies + @seasons).sort_by { |content| content['created_at'] }.reverse
    render json: @contents
  end

end
