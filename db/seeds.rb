# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

trip = Trip.create!(uid: '106758666395730546327', name: 'Test_Trip', departure_date: DateTime.now + 30.seconds,
                    arrival_date: DateTime.now + 2.days)
address_1 = Address.create!(location: '1600 Pennsylvania Ave NW, Washington DC')
address_2 = Address.create!(location: '350 State St, Salt Lake City, UT 84103')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)
