# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Relationships' do
    it { should have_many(:stops).dependent(:destroy) }
    it { should have_many(:addresses).through(:stops) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:uid) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:departure_date) }
  end

  describe 'instance methods' do
    describe '.ordered_stops' do
      let(:trip) { trip_initialize_has_many('1000', 2) }
      it 'returns a trips stops in stop order' do
        stops_arr = trip.ordered_stops
        expect(stops_arr[0].type_of_stop).to eq 'start'
        expect(stops_arr[1].type_of_stop).to eq 'extra'
        expect(stops_arr[2].type_of_stop).to eq 'extra'
        expect(stops_arr[3].type_of_stop).to eq 'end'
      end
    end
  end

   describe '#arrival_date_calulation', :vcr do
    it 'takes start date, start_address, end_address and returns estimated arrival date' do
      
      stubbed_return_value = {:realTime=>65929, :hasTollRoad=>true, :distance=>1279.8648}
      allow(NavFacade).to receive(:trip_details).and_return(stubbed_return_value)
      
      @trip1 = Trip.create!(uid: '106758666395730546327', name: 'Test_Trip_2', departure_date: "Tues, 08 Nov 2022 20:38:55 UTC +00:00".to_datetime + 30.seconds,
      arrival_date: "Fri, 14 Nov 2022 20:38:55 UTC +00:00".to_datetime)
      start_address = Address.create!(location: '2303 Braun Ct, Golden CO, 80401')
      end_address = Address.create!(location: '1823 Cedar Hill, Royal Oak, MI 48067')


      return_value = @trip1.arrival_date_calculation(@trip1.departure_date, start_address.location, end_address.location)
      expect(return_value).to eq("Wed, 09 Nov 2022 14:58:14 +0000")
    end
  end
end
