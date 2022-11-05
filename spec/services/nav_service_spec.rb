require 'rails_helper'

RSpec.describe NavService, :vcr do
  it 'should return parsed route hash #route_directions' do
    starting_address = "200 E Colfax Ave, Denver, CO 80203"
    end_address = "350 State St, Salt Lake City, UT 84103"
 
    nav_service_call = NavService.route_directions(starting_address, end_address) 
    expect(nav_service_call).to be_a(Hash)
    expect(nav_service_call[:route][:hasTollRoad]).to be_in([true, false])
    expect(nav_service_call[:route][:realTime]).to be_an(Integer)
    expect(nav_service_call[:route][:legs][0][:maneuvers][0][:distance]).to be_an(Float)
    expect(nav_service_call[:route][:legs][0][:maneuvers][0][:narrative]).to be_an(String)
  end
end