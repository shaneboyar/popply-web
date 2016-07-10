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

users = User.order(:created_at).take(10)
50.times do
  content = Faker::Hipster.paragraphs(3)
  users.each { |user| user.posts.create!(content: content) }
end

26.times do 
	name = Faker::Name.name
	image = Faker::Avatar.image
	bio = Faker::Hipster.paragraph
	contestant = Contestant.new(name: name, image: image, bio: bio)
	contestant.save
end