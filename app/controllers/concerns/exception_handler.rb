module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end
  class WrongUserType < StandardError; end
  class RelationshipError < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable
    rescue_from ExceptionHandler::MissingToken, with: :unprocessable
    rescue_from ExceptionHandler::InvalidToken, with: :unprocessable
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized
    rescue_from ExceptionHandler::WrongUserType, with: :unauthorized
    rescue_from ExceptionHandler::RelationshipError, with: :bad_request
  end

  private

  # 400
  def bad_request(e)
    json_response({ message: e.message }, :bad_request)
  end

  # 401
  def unauthorized(e)
    json_response({ message: e.message }, :unauthorized)
  end

  # 404
  def not_found(e)
    json_response({ message: e.message }, :not_found)
  end

  # 422
  def unprocessable(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

end