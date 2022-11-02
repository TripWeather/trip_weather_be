# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do; end # Will update if relationships are added

  describe 'validations' do
    it {
      should validate_presence_of :email
      should validate_uniqueness_of :email
    }
  end
end
