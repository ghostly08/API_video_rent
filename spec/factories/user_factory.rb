FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
  end

  # after(:create) do |user|
  #   create_list(:purchase, 3, user: user)
  # end
end
