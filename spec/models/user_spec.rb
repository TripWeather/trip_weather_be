# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do; end # Will update if relationships are added

  describe 'validations' do
    it {
      should validate_presence_of :uid
      should validate_presence_of :token
      should validate_presence_of :email
      should validate_presence_of :full_name
      should validate_presence_of :first_name
      should validate_presence_of :last_name
      should validate_presence_of :image
    }
  end
end
