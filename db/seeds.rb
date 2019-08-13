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


####################### CREANTING OUR USERS #######################


us = []

us << user = User.create!(
  name: 'Steven Ly',
  email: 'steven@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")
  # user.remote_photo_url = 'https://res.cloudinary.com/defdajivj/image/upload/v1565331729/us/IMG_2266_cmxywt.png'
  user.save!

us << user = User.create!(
  name: 'Steven Chareonbood',
  email: 'stevy@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")
  # user.remote_photo_url = 'https://res.cloudinary.com/defdajivj/image/upload/v1565331716/us/50242319_z1ckpv.jpg'
  user.save!

us << user = User.create!(
  name: 'Richard So',
  email: 'richard@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")
  # user.remote_photo_url = 'https://res.cloudinary.com/defdajivj/image/upload/v1565331717/us/49895590_pc8u01.jpg'
  user.save!

us << user = User.create!(
  name: 'Felipe Roschel',
  email: 'felipe@gmail.com',
  password: '123456',
  address: 'WenDing Lu',
  city: 'Shanghai',
  gender: 'male',
  bio: "Learning #{Faker::ProgrammingLanguage.name} at LeWagon 😎😎😎 ")
  # user.remote_photo_url = 'https://res.cloudinary.com/defdajivj/image/upload/v1565331731/us/IMG_20190604_142654_tancqs.jpg'
  user.save!


####################### CREANTING MATCHES #######################
puts "Main Users created!"
puts "Creating matches..."

description = [
 "Football game for advanced players", "Football, casual game",
 "Football, match, everybody is welcome!", "Basketball street game",
 "Basketball, only for the best!", "Basketball, come defeat us!",
 "Badmington, let’s have some fun", "Badmington, casual game",
 "Badmington, here to compete", "Tennis, only for serious player",
 "Tennis, let’s practice", "Tennis, here to train",
 "Volleyball, looking for good players",
 "Volleyball, casual game", "Volleyball, let’s have some fun!",
 "Pool, only good players", "Pool, all levels welcome",
 "Pool, here to have fun", "Boxing, let’s hurt each other!",
 "Boxing, here to train", "Boxing, let’s fight!"
]

level = [
 "advanced", "beginner", "beginner", "intermediate", "advanced", "advanced", "intermediate",
 "beginner", "advanced", "advanced", "intermediate", "beginner", "advanced", "intermediate",
 "intermediate", "advanced", "beginner", "intermediate", "advanced", "intermediate", "intermediate"
]

category = [
 "Football", "Football", "Football", "Basketball", "Basketball", "Basketball", "Badmington",
 "Badmington", "Badmington", "Tennis", "Tennis", "Tennis", "Volleyball", "Volleyball", "Volleyball",
 "Pool", "Pool", "Pool", "Boxing", "Boxing", "Boxing"
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

photos = [
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326326/football/jeffrey-f-lin-AKM-B2PoCOo-unsplash_uzwhgq.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326312/football/jeffrey-f-lin-e0Wq9Tnpf28-unsplash_jmgxlf.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326306/football/izuddin-helmi-adnan-K5ChxJaheKI-unsplash_mzlchw.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326464/basketball/peter-osmenda-20K-JZ2ppbE-unsplash_gtjyv0.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326461/basketball/channey-4pUmLUGDMEI-unsplash_quvtc2.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326451/basketball/tedward-quinn-LbXO_iFeL4I-unsplash_rfcbps.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326482/badminton/frank-zhang-Qy2aD_qW3W0-unsplash_njasb4.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326478/badminton/unslpsh-U5epRU6sY_A-unsplash_fssj9v.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326442/badminton/frame-harirak-UR_mNYmpwco-unsplash_ju9yyk.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326543/tennis/action-athlete-ball-342361_txq2rq.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326532/tennis/dan-gold-zZfIuQwB6UI-unsplash_bonzs0.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326528/tennis/ball-court-design-209977_dnboad.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326617/volleyball/angelo-pantazis-n9o6NDvAyyU-unsplash_khmwlj.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326602/volleyball/vince-fleming-aZVpxRydiJk-unsplash_cchfxg.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326598/volleyball/nathan-hanna-pXmaghq_2Uc-unsplash_qdrbu6.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326612/billiard/carla-oliveira-21FqSKZQGzI-unsplash_in7zuo.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326596/billiard/dimitri-bang-ZzBedSty35Y-unsplash_yxujop.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326585/billiard/carol-reis-BZkVQB2Nd1M-unsplash_jbyjx0.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326706/boxing/action-athlete-black-background-1544774_rd5urq.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326705/boxing/wade-austin-ellis-nsAEILApJfs-unsplash_lddig4.jpg",
  "https://res.cloudinary.com/defdajivj/image/upload/v1565326692/boxing/alora-griffiths-XW47yQNE0TQ-unsplash_yjj2df.jpg"
]


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
  match.tag_list.add(["Shanghai", level[index], category[index]])
  # match.remote_photo_url = photos[index]
  match.save!

  Player.create!(
    match_id: match.id,
    user_id: match.user_id,
    team: 'A',
    status: 'accepted',
    challenger_id: match.user_id
  )

  Category.create!(
    name: category[index],
    level: level[index],
    points: rand(400..800),
    user_id: match.user_id
  )
  puts "Match Created!"
end

puts "Created #{Match.count} matches!"


####################### CREANTING USERS #######################

puts "Creating users..."

profile = [
  "https://images.unsplash.com/photo-1539605480396-a61f99da1041?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1561055657-b9e0bf0fa360?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1544435253-f0ead49638fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1554780336-390462301acf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1546422401-68b415cbf8de?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1552673304-23f6ad21aada?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1561893836-adae6b766f82?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1512814078102-ed265de440fd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1541439998155-388623962c26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1478070531059-3db579c041d5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1441486374104-36abe5ed9b69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1467400492058-1aad44d4bcd6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1495374519711-e22c8b4596a0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1475021200099-fd2cbb889dd1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1474978528675-4a50a4508dc3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1499557354967-2b2d8910bcca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1503235930437-8c6293ba41f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1505033575518-a36ea2ef75ae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1458765330184-16a8a2c77a57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1473700216830-7e08d47f858e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1470441623172-c47235e287ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1470816692915-9bd859f41421?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1483323323858-4916bde7bd5d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1429117257281-73c32df3dcdc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1501143779831-7639ccda8d10?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1462062651745-495db7fa268a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1480535339474-e083439a320d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1484086471933-a4fcb164629c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1436985847904-40f78a6bef9d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1495347353326-f1e32ba8e136?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1486583474878-b16d8f2749b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1495516372021-9c815fa7e668?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1497316730643-415fac54a2af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1498798821241-1f327af804fe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
  "https://images.unsplash.com/photo-1523307730650-594bc63f9d67?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
]


# Categoryes
def add_category(user, level, category)
  Category.create!(
    name: category.sample,
    level: level.sample,
    points: rand(100..300),
    user_id: user.id
  )
end


# Famous Players
index = -1

10.times do
  index += 1
  user = User.new(
    name: Faker::Sports::Football.player,
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "#{Faker::Sports::Football.position} at #{Faker::Sports::Football.team} player!"
  )
  # user.remote_photo_url = profile[index]
  user.save!
  add_category(user, level, category)
  puts "User Created!"
end

# Geeks

5.times do
  index += 1
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "#{Faker::Game.platform} lover, trying some new activities #{Faker::SlackEmoji.activity} #{Faker::SlackEmoji.people}"
  )
  # user.remote_photo_url = profile[index]
  user.save!
  add_category(user, level, category)
  puts "User Created!"
end

# Programmers

5.times do
  index += 1
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "#{Faker::ProgrammingLanguage.name} developer, tired of being sat all day long xXX 💻💻💻"
  )
  # user.remote_photo_url = profile[index]
  user.save!
  add_category(user, level, category)
  puts "User Created!"
end

# Sport Ppl

5.times do
  index += 1
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "Sport enthusiast and #{Faker::Beer.brand} 🍺🍺🍺 and #{Faker::Food.dish}"
  )
  # user.remote_photo_url = profile[index]
  user.save!
  add_category(user, level, category)
  puts "User Created!"
end

# Hispter

5.times do
  index += 1
  user = User.new(
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: Faker::Internet.email,
    password: '123456',
    address: Faker::Address.full_address,
    city: Faker::Address.city,
    gender: Faker::Gender.binary_type,
    bio: "Graduated at #{Faker::University.name}, fav reading #{Faker::Book.title} 📚, #{Faker::Music.instrument} player!"
  )
  # user.remote_photo_url = profile[index]
  user.save!
  add_category(user, level, category)
  puts "User Created!"
end


puts "Created #{User.count} users!"

puts "Created #{Category.count} categories!"
