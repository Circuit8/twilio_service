class Call
  include ActiveModel::Model

  attr_accessor :from, :to

  def ring
    TwilioClient.new.calls.create(
      to: to,
      from: from,
      url: 'http://demo.twilio.com/docs/voice.xml'
    )
  end
end
