# frozen_string_literal: true

class Trip < ApplicationRecord
  before_destroy :destroy_addresses
  before_create :date_cannot_be_in_past
  before_update :date_cannot_be_in_past

  has_many :stops, dependent: :destroy
  has_many :addresses, through: :stops

  validates :uid, presence: true
  validates :name, presence: true
  validates :departure_date, presence: true
  validates :arrival_date, presence: true

  # , comparison: { less_than: :arrival_date }

  private

  def date_cannot_be_in_past
    return unless departure_date.past? || arrival_date.past?

    raise ActiveRecord::StatementInvalid, 'Date cannot be in the past'
  end

  def destroy_addresses
    addresses.destroy_all
  end
end
