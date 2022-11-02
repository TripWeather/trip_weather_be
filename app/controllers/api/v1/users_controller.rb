# frozen_string_literal: true


class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_or_create_by!(email: user_params[:email])
    user.update(uid: user_params[:uid], token: user_params[:token], name: user_params[:name],
                first_name: user_params[:first_name], last_name: user_params[:last_name], image: user_params[:image])
    render json: UserSerializer.new(user), status: 201
  end

  private

  def user_params
    params.permit(:uid, :token, :name, :first_name, :last_name, :email, :image)
  end
end
