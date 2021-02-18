# handles initialization of the twilio client
class TwilioClient
  attr_reader :client

  delegate_missing_to :client

  def initialize
    credential_environment = Rails.env.test? ? :test : :production
    @client = Twilio::REST::Client.new(Rails.application.credentials.twilio[credential_environment][:sid],
                                       Rails.application.credentials.twilio[credential_environment][:auth_token])
  end
end
