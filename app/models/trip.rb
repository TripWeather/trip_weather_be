# frozen_string_literal: true

class Trip < ApplicationRecord
  before_destroy :destroy_addresses

  has_many :stops, dependent: :destroy
  has_many :addresses, through: :stops

  validates :uid, presence: true
  validates :name, presence: true

  validate :date_cannot_be_in_past,
           :date_order

  validates :departure_date, presence: true
  validates :arrival_date, presence: true

  private

  def destroy_addresses
    addresses.destroy_all
  end

  def date_order
    return unless arrival_date.present? && arrival_date < departure_date

    errors.add(:arrival_date, "can't before departure date")
  end

  def date_cannot_be_in_past
    departure_cannot_be_in_past
    arrival_cannot_be_in_past
  end

  def departure_cannot_be_in_past
    return unless departure_date.present? && departure_date < (Time.current - 30.seconds)

    errors.add(:departure_date, "can't be in the past")
  end

  def arrival_cannot_be_in_past
    return unless arrival_date.present? && arrival_date < (Time.current - 30.seconds)

    errors.add(:arrival_date, "can't be in the past")
  end

  
end
