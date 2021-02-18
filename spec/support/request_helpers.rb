# frozen_string_literal: true

module RequestSpecHelpers
  def json_response
    JSON.parse(response.body)
  end

  def auth_headers
    { 'Authorization' => "Bearer #{Rails.application.credentials.auth_token}" }
  end
end
