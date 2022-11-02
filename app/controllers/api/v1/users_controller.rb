# frozen_string_literal: true


class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_create_by!(email: user_params[:email])
    user.update(user_params)
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.require(:user).permit(:uid, :token, :full_name, :first_name, :last_name, :email, :image)
  end
end
