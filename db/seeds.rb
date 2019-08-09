# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Forum.delete_all
Player.delete_all
Match.delete_all
Category.delete_all
User.delete_all

####################### CREANTING USERS #######################


puts "Creating users..."

# Famous Players
10.times do
  user = User.new(
    name: Faker::Sports::Football.player,
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "#{Faker::Sports::Football.position} at #{Faker::Sports::Football.team} player!"
  )
  # user.remote_photo_url = Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports')
  user.save!
end

# Geeks
5.times do
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "#{Faker::Game.platform} lover, trying some new activities #{Faker::SlackEmoji.activity} #{Faker::SlackEmoji.people}"
  )
  # user.remote_photo_url = Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports')
  user.save!
end

# Programmers
5.times do
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "#{Faker::ProgrammingLanguage.name} developer, tired of being sat all day long xXX 💻💻💻"
  )
  # user.remote_photo_url = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
  user.save!
end

# Sport Ppl
5.times do
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "Sport enthusiast and #{Faker::Beer.brand} 🍺🍺🍺 and #{Faker::Food.dish}"
  )
  # user.remote_photo_url = Faker::LoremPixel.image(size: "50x60", is_gray: false, category: 'sports')
  user.save!
end

# Hispter
5.times do
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "Graduated at #{Faker::University.name}, fav reading #{Faker::Book.title} 📚, #{Faker::Music.instrument} player!"
  )
  # user.remote_photo_url = Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")
  user.save!
end

us = []

us << User.create!(
  name: 'Steven Ly',
  email: 'steven@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")

us << User.create!(
  name: 'Steven Chareonbood',
  email: 'stevy@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")

us << User.create!(
  name: 'Richard So',
  email: 'richard@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")

us << User.create!(
  name: 'Felipe Roschel',
  email: 'felipe@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")

puts "Created #{User.count} users!"



####################### CREANTING MATCHES #######################

puts "Creating matches..."

description = [
 "Football game for advanced players",
 "Football, casual game",
 "Football, match, everybody is welcome!",
 "Basketball street game",
 "Basketball, only for the best!",
 "Basketball, come defeat us!",
 "Badmington, let’s have some fun",
 "Badmington, casual game",
 "Badmington, here to compete",
 "Tennis, only for serious player",
 "Tennis, let’s practice",
 "Tennis, here to train",
 "Volleyball, looking for good players",
 "Volleyball, casual game",
 "Volleyball, let’s have some fun!",
 "Pool, only good players",
 "Pool, all levels welcome",
 "Pool, here to have fun",
 "Boxing, let’s hurt each other!",
 "Boxing, here to train",
 "Boxing, let’s fight!"
]

level = [
 "advanced",
 "beginner",
 "beginner",
 "intermediate",
 "advanced",
 "advanced",
 "intermediate",
 "beginner",
 "advanced",
 "advanced",
 "intermediate",
 "beginner",
 "advanced",
 "intermediate",
 "intermediate",
 "advanced",
 "beginner",
 "intermediate",
 "advanced",
 "intermediate",
 "intermediate"
]

category = [
 "Football",
 "Football",
 "Football",
 "Basketball",
 "Basketball",
 "Basketball",
 "Badmington",
 "Badmington",
 "Badmington",
 "Tennis",
 "Tennis",
 "Tennis",
 "Volleyball",
 "Volleyball",
 "Volleyball",
 "Pool",
 "Pool",
 "Pool",
 "Boxing",
 "Boxing",
 "Boxing"
]

address = [
 "5500, Chuansha Road, Pudong, 201200 Shanghai, China",
 "555 Middle Xizang Road (Close to Nanjing Road), Huangpu, 200003 Shanghai, China",
 "No.30, Lane.1466, Pudong South Road, Pudong, 200122 Shanghai, China",
 "99 Madang Road, Huangpu, 200021 Shanghai, China",
 "No.2299 Zuchongzhi Road near Shengjiang Road, Pudong, 201203 Shanghai, China",
 "No.288 Huxing, Minhang, 201101 Shanghai, China",
 "No.2588, Jinxiu Road, Pudong, 200125 Shanghai, China",
 "No.30, Shaan Xi South Rd, Jing’an, 200040 Shanghai, China",
 "2099 Yan An Xi Road, Changning, 200336 Shanghai, China",
 "1108 Meihua Road, Pudong, 201204 Shanghai, China",
 "2270 Hong Qiao Road, Changning, 200336 Shanghai, China",
 "No.7 Donghu Road, Xuhui, 200031 Shanghai, China",
 "778 Dongfang Road, Pudong, 200122 Shanghai, China",
 "918 Yan’an Road (west), Changning, 200052 Shanghai, China",
 "No.37, Meiyuan Road, Jing’an, 200070 Shanghai, China",
 "100 HongQiao Road, Xuhui, 200030 Shanghai, China",
 "14 Xichengli Residence, Lane 278 Madang Road, Huangpu Road, Huangpu, 200000 Shanghai, China",
 " No 199 WuLuMuQi North Road, 16th floor, Jing’an, 200040 Shanghai, China",
 "No.555 Jiujiang Road, Huangpu, 200000 Shanghai, China",
 "No. 800, Hua Mu Road, Pudong, 201204 Shanghai, China",
 "No. 800, Hua Mu Road, Pudong, 201204 Shanghai, China"
]

number_of_players = [10,8,22,10,6,4,2,4,2,2,2,4,8,10,8,2,2,4,2,2,2]

index = -1

21.times do
  index += 1
  match = Match.new(
    date: Faker::Date.forward(days: 23),
    city: "Shanghai",
    location: address[index],
    description: description[index],
    time: Faker::Time.forward(days: 23, period: :evening),
    level: level[index],
    number_of_players: number_of_players[index],
    status: 'open',
    score: 0,
    user_id: us.sample.id)
  match.save!
end

puts "Created #{Match.count} matches!"
