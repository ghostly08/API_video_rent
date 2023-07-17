require "rails_helper"

RSpec.describe MoviesController, type: :request do

  let!(:movies) { create_list(:movie, 3) }
  let(:movie_id) { movies.first.id }

  context 'GET /index' do

    before { get '/movies' }

    it 'returns movies' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to be_successful
    end

  end

  context 'GET /show' do

    before { get "/movies/#{movie_id}" }

    it 'returns movie' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(movie_id)
    end

    it 'returns status code 200' do
      expect(response).to be_successful
    end

  end


end
