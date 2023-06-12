# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

5.times do |i|
  User.create!(
    email: "user#{i + 1}@mail.com",
    password: "user1234",
    name: "user#{i + 1}",
    role: 0
  )
end

users = User.all

9.times do
  Post.create!(
    image: Faker::Avatar.image,
    title: Faker::Lorem.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 50),
    user_id: users.sample.id
  )

end