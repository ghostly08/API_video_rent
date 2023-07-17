require "rails_helper"

RSpec.describe SeasonsController, type: :request do

  let!(:seasons) { create_list(:season, 3) }
  let(:season_id) { seasons.first.id }

  context 'GET / Index' do

    before { get '/seasons' }

    it 'returns seasons' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to be_successful
    end

  end

  context 'GET / Show' do

    before { get "/seasons/#{season_id}" }

    it 'returns season' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(season_id)
    end

    it 'returns status code 200' do
      expect(response).to be_successful
    end

  end

end
