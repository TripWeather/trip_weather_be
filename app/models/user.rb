# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid,
            :token,
            :email,
            :full_name,
            :first_name,
            :last_name,
            :image,
            presence: true
end
