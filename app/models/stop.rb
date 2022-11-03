# frozen_string_literal: true

class Stop < ApplicationRecord
  belongs_to :trip
  belongs_to :address

  validates :type, presence: true
end
