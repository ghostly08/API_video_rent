FactoryBot.define do
  factory :purchase do
    user
    price { 2.99 }
    quality { "HD" }
    purchased_at { Time.now }
    content { create(:movie) }
  end
end
