# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :first_name, :last_name, :email, :image
end
