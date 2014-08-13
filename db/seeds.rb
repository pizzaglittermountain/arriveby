# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

e = Event.new
e.start_location = "225 N. Michigan Ave, Chicago"
e.end_location = "30 North Racine Ave, Chicago"
e.arrival_time = Time.now + 8.minutes
e.phone_number = "6145813654"
