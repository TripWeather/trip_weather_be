# frozen_string_literal: true

class Trip < ApplicationRecord
  before_destroy :destroy_addresses

  has_many :stops, dependent: :destroy
  has_many :addresses, through: :stops

  validates :uid, presence: true
  validates :name, presence: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true

  private

  def destroy_addresses
    addresses.destroy_all
  end
end
