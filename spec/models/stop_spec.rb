# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stop, type: :model do
  describe 'Relationships' do
    it { should belong_to(:trip) }
    it { should belong_to(:address) }
    it 'i' do
      binding.pry
    end
  end

  describe 'Validations' do
    it { should validate_presence_of(:type_of_stop) }
  end
end

