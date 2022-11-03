# frozen_string_literal: true

class Trip < ApplicationRecord
  has_many :stops, dependent: :destroy
  has_many :addresses, through: :stops

  validates :uid,
            :name,
            :departure_date,
            presence: true
end
