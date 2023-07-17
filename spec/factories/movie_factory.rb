FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Test Title #{n}" }
    plot { "Toto, I've got a feeling we're not in Kansas anymore." }
  end

  trait :with_purchase do
    after(:create) do |movie|
      create_list(:purchase, 5, content: movie)
    end
  end

end
