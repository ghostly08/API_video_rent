# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
puts "Clear all existing data"
Movie.destroy_all
Season.destroy_all
Episode.destroy_all

puts "Creating movies"
20.times do
  Movie.create(
    title: Faker::Movie.title,
    plot: Faker::Movie.quote
  )
end
puts "20 movies created!!"

puts "Creating seasons and episodes"
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
puts "5 seasons and its 10 episodes created!!"
