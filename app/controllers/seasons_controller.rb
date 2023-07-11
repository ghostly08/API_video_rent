class SeasonsController < ApplicationController
  def index
    @seasons = Season.order(created_at: :desc)
    render json: @seasons, include: :episodes
  end

  def show
    @season = Season.find(params[:id])
    render json: @season, include: :episodes
  end
end
