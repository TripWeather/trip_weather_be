# frozen_string_literal: true

class Trip < ApplicationRecord
  before_destroy :destroy_addresses

  has_many :stops, dependent: :destroy
  has_many :addresses, through: :stops

  validates :uid, presence: true
  validates :name, presence: true
  validates :departure_date, presence: true # check for past dates
  validates :arrival_date, presence: true # check for past dates
  validate :date_cannot_be_in_past

  private

  def date_cannot_be_in_past
    return unless departure_date.present? && departure_date.past?

    raise ActiveRecord::StatementInvalid, 'Date cannot be in the past'
  end

  def destroy_addresses
    addresses.destroy_all
  end
end