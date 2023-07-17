class SeasonsController < ApplicationController
  def index
    @seasons = Rails.cache.fetch('seasons', expires_in: 12.hours) do
      Season.order(created_at: :desc)
    end
    render json: @seasons, include: :episodes
  end

  def show
    @season = Season.find(params[:id])
    render json: @season, include: :episodes
  end
end
