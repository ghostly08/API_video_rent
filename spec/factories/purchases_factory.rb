FactoryBot.define do
  factory :purchase do
    user
    season
    price { 2.99 }
    quality { "HD" }
    purchased_at { Time.now }
    content_type { create(:movie) }
    content_id { create(:movie).id }
  end
end
