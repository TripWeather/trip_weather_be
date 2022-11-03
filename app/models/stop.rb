# frozen_string_literal: true

class Stop < ApplicationRecord
  belongs_to :trip
  belongs_to :address

  validates :type_of_stop, presence: true
end
