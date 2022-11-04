require 'rails_helper'

RSpec.describe 'Navigation Facade', :vcr do
  it '#get_directions for entire route' do
    starting_address = "200 E Colfax Ave, Denver, CO 80203"
    end_address = "350 State St, Salt Lake City, UT 84103"

    trip = NavFacade.get_directions(starting_address, end_address)

    expect(trip).to be_an(Hash)

    # trip.each do |step|
    #   require 'pry'; binding.pry
    #   expect(step).to be_a(Navigation) #not sure what it should be considered
    # end
  end

  it '#get_trip_details' do
    starting_address = "200 E Colfax Ave, Denver, CO 80203"
    end_address = "350 State St, Salt Lake City, UT 84103"
    details = NavFacade.get_trip_details(starting_address, end_address)

    expect(details).to be_an(Hash)


  end


end