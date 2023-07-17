require "rails_helper"

RSpec.describe PurchasesController, type: :request do

  let(:user) { create(:user) }
  let(:user_id) { user.id }
  let(:purchases) { create_list(:purchase, 5, user: user, purchased_at: Time.now) }
  let(:purchase_id) { purchases.first.id }

  context 'GET / Index' do
    before { get "/users/#{user.id}/purchases" }

    it 'returns all purchases' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)

    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'POST / Create' do

    before do
      post "/users/#{user.id}/purchases", params: {
        purchase: {
          content_id: 1,
          content_type: "Movie",
          quality: "HD",
          price: 2.99,
          purchased_at: Time.now
        }
      }
    end

    it 'returns the purchase' do
      expect(json).not_to be_empty
      expect(json['user_id']).to eq(user.id)
      expect(json['content_id']).to eq(1)
      expect(json['content_type']).to eq("Movie")
      expect(json['quality']).to eq("HD")
      expect(json['price']).to eq(2.99)
      expect(json['purchased_at']).to eq(Time.now.strftime("%Y-%m-%dT%H:%M:%S.%LZ"))
    end
  end

end
