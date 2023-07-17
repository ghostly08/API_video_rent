FactoryBot.define do
  factory :episode do
    title { "Winter Is Coming" }
    plot { "Eddard Stark is torn between his family and an old friend." }
    number { 1 }
    season
  end
end
