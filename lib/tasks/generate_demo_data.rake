namespace :demo do
  desc "Generate demo data for production environment"
  task generate_data: :environment do
    # Create 1 user
    User.create(email: "steven@example.com")

    # Creating 20 movies
    20.times do
      Movie.create(
        title: Faker::Movie.title,
        plot: Faker::Movie.quote
      )
    end

    # Creating 5 seasons and its 10 episodes
    5.times do
      season = Season.create(
        title: Faker::Book.title,
        plot: Faker::Movie.quote,
        number: rand(1..10)
      )
      10.times do |i|
        season.episodes.create(
          title: Faker::Movie.title,
          plot: Faker::Movie.quote,
          number: i + 1
        )
      end
    end
  end
end
