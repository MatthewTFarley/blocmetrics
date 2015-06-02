# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create my account
matt = User.new(
  name:      "Matthew Farley",
  email:     "matthewthomasfarley@gmail.com",
  password:  "helloworld"
  )
matt.skip_confirmation!
matt.save!
# Create Users
5.times do
  user = User.new(
    name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password:  "helloworld"
    )
  user.skip_confirmation!
  user.save!
end
users = User.all
users << matt

# Create Applications
6.times do
  Application.create!(
    user:        users.sample,
    name:       Faker::App.name,
    url:        Faker::Internet.url, 
    created_at:  DateTime.now
    )
end
applications = Application.all

# Creat Events
30.times do
  Event.create!(
    application: applications.sample,
    name: Faker::Hacker.ingverb + " " + Faker::Hacker.noun,
    created_at: DateTime.now
  )
end
events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Application.count} applications created"
puts "#{Event.count} events created"
puts "#{matt.name}'s account created"