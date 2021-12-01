class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  private

  def render_not_found(error)
    render json: error, status: :not_found
  end

  def render_invalid(invalid)
    render json: invalid.record.errors.full_messages, status: :unprocessable_entity
  end

end
