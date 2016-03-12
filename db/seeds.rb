# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

m = Player.create(name: 'Mihai')

Aktion.create(timeslot: Time.now.at_beginning_of_hour, player: m, focus: 'Doing something else')
Aktion.create(timeslot: Time.now.at_beginning_of_hour - 30.minutes, player: m, focus: 'Doing something')
