FactoryBot.define do
  factory :movie do
    sequence(:title) { |n| "Test Title #{n}" }
    plot { "Toto, I've got a feeling we're not in Kansas anymore." }
  end
end
