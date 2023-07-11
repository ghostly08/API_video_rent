class ContentsController < ApplicationController

  def index
    @movies = Movie.order(created_at: :desc)
    @seasons = Season.includes(:episodes).order(created_at: :desc).map do |season|
      season.as_json(include: :episodes)
    end

    @contents = (@movies + @seasons).sort_by { |content| content['created_at'] }.reverse
    render json: @contents
  end

end
