# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Match.delete_all if Rails.env.development?
User.delete_all if Rails.env.development?

levels = %w(beginner intermediate advanced)

puts "Creating users..."

20.times do
  user = User.new(
    name: Faker::Sports::Football.player,
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "#{Faker::Quotes::Shakespeare.as_you_like_it_quote} #{Faker::Quotes::Shakespeare.hamlet_quote}"
  )
  user.save!
end

User.create!(
  name: 'felipe',
  email: 'felipe@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: '...')

puts "Created #{User.count} users!"


puts "Creating matches..."

10.times do

  match = Match.new(
    date: Faker::Date.forward(days: 23),
    city: Faker::Address.city,
    location: Faker::Address.full_address,
    description: Faker::Sports::Football.competition,
    time: Faker::Time.between(from: DateTime.now - 12, to: DateTime.now),
    level: levels.sample,
    number_of_players: [2, 4, 6, 8].sample,
    status: 'open',
    score: 0,
    user_id: User.last.id)
  match.save!
end

puts "Created #{Match.count} matches!"




