# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LatLong do
  response_hash =
    {
      "lat": 38.897675,
      "lng": -77.036547
    }

  let(:object) { LatLong.new(response_hash) }

  it 'instantiates' do
    expect(object).to be_an_instance_of(LatLong)
  end

  it 'has attributes' do
    expect(object.latitude).to eq(38.897675)
    expect(object.longitude).to eq(-77.036547)
  end
end
