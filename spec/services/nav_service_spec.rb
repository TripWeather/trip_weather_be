require 'rails_helper'

RSpec.describe NavService, :vcr do
  it 'should return parsed route hash' do
    nav_service_call = NavService.nav_info("Clarendon Blvd, Arlington, VA", "1823 Cedar Hill, Royal Oak, MI")

    expect(nav_service_call).to be_a(Hash)
    expect(nav_service_call[:route][:realTime]).to be_an(Integer)
  end
end