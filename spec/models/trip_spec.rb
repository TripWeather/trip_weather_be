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
end
