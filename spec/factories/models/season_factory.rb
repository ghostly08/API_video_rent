FactoryBot.define do
  factory :season do
    transient do
      sequence_number { generate(:season_sequence) }
    end
    title { |n| "Season Title #{sequence_number}" }
    plot { "Nine noble families fight for control over the mythical lands of Westeros." }
    number { sequence_number }

    to_create do |instance|
      instance.save(validate: false)
    end
  end

  sequence :season_sequence

end
