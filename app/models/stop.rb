# frozen_string_literal: true

class Stop < ApplicationRecord
  belongs_to :trip
  belongs_to :address

  validates :type_of_stop, presence: true
  enum type_of_stop: %i[start extra end]
end
