require 'rails_helper'

RSpec.describe 'Navigation Facade', :vcr do
  it '#get_directions for entire route' do
    starting_address = "200 E Colfax Ave, Denver, CO 80203"
    end_address = "350 State St, Salt Lake City, UT 84103"

    trip = NavFacade.get_directions(starting_address, end_address)
    expect(trip).to be_an(Array)

    trip.each do |step|
      expect(step).to be_an(Array) 
    end
  end

  it '#get_trip_details' do
    starting_address = "200 E Colfax Ave, Denver, CO 80203"
    end_address = "350 State St, Salt Lake City, UT 84103"
    details = NavFacade.trip_details(starting_address, end_address)

    expect(details).to be_an(Hash)
    expect(details).to have_key(:realTime)
    expect(details).to have_key(:fuelUsed)
    expect(details).to have_key(:hasTollRoad)
    expect(details).to have_key(:distance)
  end

  describe '#nav_object' do
  start_address = "200 E Colfax Ave, Denver, CO 80203"
  end_address = "350 State St, Salt Lake City, UT 84103"
  
  it 'takes get_directions array, and trip details hash, and returns a Nav object with the directions and details' do
      object = NavFacade.nav_object(start_address, end_address)
# require 'pry'; binding.pry
      expect(object).to be_a(Nav)
    end
  end
end