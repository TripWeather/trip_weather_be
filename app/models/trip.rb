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

  def ordered_stops
    stops.order(:type_of_stop)
  end

  private

  def arrival_date_calculation(start_date, start_address, end_address)
    trip_details_hash = NavFacade.trip_details(start_address, end_address)
    time_to_end_address_in_seconds = trip_details_hash[:realTime]
    estimated_arrival_date = start_date.to_datetime + time_to_end_address_in_seconds.seconds
  end

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
    return unless departure_date.present? && departure_date < (Time.current - 30.minutes)

    errors.add(:departure_date, "can't be in the past")
  end

  def arrival_cannot_be_in_past
    return unless arrival_date.present? && arrival_date < (Time.current - 30.minutes)

    errors.add(:arrival_date, "can't be in the past")
  end
end
