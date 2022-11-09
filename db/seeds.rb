# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

trip = Trip.create!(uid: '1000', name: 'Test_Trip', departure_date: Time.current + 30.seconds,
                    arrival_date: Time.current + 2.days)
address_1 = Address.create!(location: '200 E Colfax Ave, Denver, CO 80203')
address_2 = Address.create!(location: '1600 Pennsylvania Avenue NW, Washington, DC 20500')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)

trip = Trip.create!(uid: '1000', name: 'Test_Trip_2', departure_date: Time.current + 30.seconds,
                    arrival_date: Time.current + 5.days)
address_1 = Address.create!(location: '110 W George Street Milford, PA 18337')
address_2 = Address.create!(location: '350 State St, Salt Lake City, UT 84103')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)

trip = Trip.create!(uid: '1000', name: 'Test_Trip_3', departure_date: Time.current + 30.seconds,
                    arrival_date: Time.current + 10.days)
address_1 = Address.create!(location: '110 W George Street Milford, PA 18337')
address_2 = Address.create!(location: '350 State St, Salt Lake City, UT 84103')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)

trip = Trip.create!(uid: '1000', name: 'Test_Trip_4', departure_date: Time.current + 30.seconds,
                    arrival_date: Time.current + 10.days)
address_1 = Address.create!(location: '200 E Colfax Ave, Denver, CO 80203')
address_2 = Address.create!(location: '1530 Blake Street Denver, CO 80202')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)

trip = Trip.create!(uid: '106758666395730546327', name: 'Stephen Trip', departure_date: Time.current + 30.seconds,
                    arrival_date: Time.current + 2.days)
address_1 = Address.create!(location: '1600 Pennsylvania Ave NW, Washington DC 20500')
address_2 = Address.create!(location: '350 State St, Salt Lake City, UT 84103')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)

trip = Trip.create!(uid: '106758666395730546327', name: 'Sandy Trip', departure_date: Time.current + 30.seconds,
                    arrival_date: Time.current + 5.days)
address_1 = Address.create!(location: '1700 W. Washington St, Phoenix, AZ 85007')
address_2 = Address.create!(location: '350 State St, Salt Lake City, UT 84103')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)

trip = Trip.create!(uid: '106758666395730546327', name: 'Erik Trip', departure_date: Time.current + 30.seconds,
                    arrival_date: Time.current + 10.days)
address_1 = Address.create!(location: '1700 W. Washington St, Phoenix, AZ 85007')
address_2 = Address.create!(location: '1530 Blake Street Denver, CO 80202')
Stop.create!(trip_id: trip.id, address_id: address_1.id, type_of_stop: 0)
Stop.create!(trip_id: trip.id, address_id: address_2.id, type_of_stop: 2)
