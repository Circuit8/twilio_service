class ApplicationController < ActionController::API
  before_action :authenticate_token!

  protected

  def authenticate_token!
    unless (bearer_token = load_bearer_token)
      return render(json: { errors: 'No API token given' }, status: :unauthorized)
    end

    render(json: { errors: 'Incorrect API token' }, status: :unauthorized) unless token_valid?(bearer_token)
  end

  def load_bearer_token
    pattern = /^Bearer /
    header = request.headers['Authorization']
    header.gsub(pattern, '') if header&.match?(pattern)
  end

  def token_valid?(token)
    Rails.application.credentials.auth_token == token
  end
end
