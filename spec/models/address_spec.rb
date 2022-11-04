# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Relationships' do
    it { should have_many(:stops).dependent(:destroy) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:location) }
  end
end
