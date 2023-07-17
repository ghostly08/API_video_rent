require 'rails_helper'

RSpec.describe UsersController, type: :request do

  let!(:users) { create_list(:user, 3) }
  let(:user_id) { users.first.id }

  context 'GET /index' do

    before { get '/users' }

    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(3)
    end

    it 'returns status code 200' do
      expect(response).to be_successful
    end

  end

  context 'GET /show' do

    before { get "/users/#{user_id}" }

    it 'returns user' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(user_id)
    end

    it 'returns status code 200' do
      expect(response).to be_successful
    end

  end

end
