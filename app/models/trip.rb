# frozen_string_literal: true

class Trip < ApplicationRecord
  before_destroy :destroy_addresses

  has_many :stops, dependent: :destroy
  has_many :addresses, through: :stops

  validates :uid, presence: true
  validates :name, presence: true

  validate :departure_cannot_be_in_past, :arrival_cannot_be_in_past
  validates :departure_date, presence: true
  validates :arrival_date, presence: true

  private

  def destroy_addresses
    addresses.destroy_all
  end

  def departure_cannot_be_in_past
    errors.add(:departure_date, "can't be in the past") if departure_date.present? && departure_date < Time.current
  end

  def arrival_cannot_be_in_past
    errors.add(:arrival_date, "can't be in the past") if arrival_date.present? && arrival_date < Time.current
  end
end
