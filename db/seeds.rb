# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do 
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = Faker::Internet.free_email(first_name)
	password = Faker::Internet.password
	image = Faker::Avatar.image
	user = User.new(first_name: first_name, last_name: last_name, email: email, password: password, image_link: image)
	user.save
end

first_name = "Shane"
last_name = "Boyar"
email = "shane.boyar@gmail.com"
password = "password"
user = User.new(first_name: first_name, last_name: last_name, email: email, password: password)
user.save


5.times do
	name = Faker::StarWars.character + " League"
	owner_id = Faker::Number.between(1, 11)
	league = League.new(name: name, owner_id: owner_id)
	league.save
end


all_users = User.all
all_users.each do |user|
	leagueid = Faker::Number.between(1, 5)
	league = League.find(leagueid)
	league.players.push(user)
end


all_players = LeagueUser.all
all_players.each do |player|
	player.score = Faker::Number.between(0, 500)
	player.save
end

26.times do 
	name = Faker::Name.name
	image = Faker::Avatar.image
	bio = Faker::Hipster.paragraph
	age = Faker::Number.between(23, 35)
	occupation = Faker::Company.profession
	contestant = Contestant.new(name: name, image: image, bio: bio, age: age, occupation: occupation)
	contestant.save
end