# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :full_name, :first_name, :last_name, :email, :image
end
