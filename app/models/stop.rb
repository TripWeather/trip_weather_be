class Stop < ApplicationRecord
  belongs_to :trip
  belongs_to :address
end
