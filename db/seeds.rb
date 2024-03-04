# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "json"
require "open-uri"

Movie.destroy_all

puts "start seeds"

#50.times do
#  Movie.create(
#    title: Faker::Movie.title,
#    overview: Faker::Movie.quote,
#    rating: rand(0..10)
#  )
#end

url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.open(url).read
result = JSON.parse(movies_serialized)
movies = result["results"]

movies.each do |movie|
  Movie.create(
  title: movie["title"],
  overview: movie["overview"],
  rating: movie["vote_average"],
  poster_url: movie["poster_path"]
  )
end
puts "seeds done"
