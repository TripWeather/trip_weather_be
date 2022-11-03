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
end

