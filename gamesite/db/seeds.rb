# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
User.create!(email: 'angry@arghblargh.co.uk', password: 'password1', role: :admin, username: 'Max', wins: 3)
User.create!(email: 'fakeperson@bumblebee.co.uk', password: 'password2', role: :admin, username: 'Humphrey', wins: 5)
User.create!(email: 'fakepeople@bumblebee.co.uk', password: 'password3', role: :admin, username: 'JenniferL', wins: 99)

# Computer players Don't touch!
User.create!(email: 'randy@randolph.co.uk', password: 'password4', role: :admin, username: 'AI-Random', wins: 3000)

Game.delete_all