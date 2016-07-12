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


3.times do 
	user_id = Faker::Number.between(1, 10)
	user = User.find(user_id)
	title = Faker::Superhero.name + " League"
	params = { owner_id: user_id, title: title }
	user.groups.create(params)
end

users = User.all
groups = Group.all
owners = []
groups.each do |group|
	owner = User.find(group.owner_id)
	owners.push(owner)
end

non_owners = users - owners
non_owners.each do |user|
	group_id = Faker::Number.between(1, 3)
	group = Group.find(group_id)
	group.members.push(user)
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