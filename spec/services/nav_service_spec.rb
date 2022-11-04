require 'rails_helper'

RSpec.describe NavService, :vcr do
  it 'should return parsed route hash' do
    starting_address = "200 E Colfax Ave, Denver, CO 80203"
    end_address = "350 State St, Salt Lake City, UT 84103"
 
    nav_service_call = NavService.route_directions(starting_address, end_address) #lat/long or substituting the spaces for pluses
    expect(nav_service_call).to be_a(Hash)
    expect(nav_service_call[:route][:realTime]).to be_an(Integer)
  end
end