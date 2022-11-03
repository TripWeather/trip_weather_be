# frozen_string_literal: true

class Address < ApplicationRecord
  has_many :stop, dependent: :destroy

  validates :location, presence: true
end
