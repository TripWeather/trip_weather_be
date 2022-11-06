# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_unprocessable_entity(exception)
    render json: catch_exception_unprocessable_entity(exception), status: :unprocessable_entity
  end

  def render_not_found(exception)
    render json: catch_exception_not_found(exception), status: :not_found
  end

  private

  def catch_exception_not_found(exception)
    error = { status: '404', title: Rack::Utils::HTTP_STATUS_CODES[404], detail: exception }
    error_message(error)
  end

  def catch_exception_unprocessable_entity(exception)
    errors = exception.message.split(':')[1].split(',').map(&:strip)
    error = { status: '422', title: Rack::Utils::HTTP_STATUS_CODES[422], detail: errors }
    error_message(error)
  end

  def error_message(error)
    { message: 'your query could not be completed', errors: [error] }
  end
end
