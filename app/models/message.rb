class Message
  include ActiveModel::Model

  attr_accessor :body, :from, :to

  def send
    TwilioClient.new.messages.create({
                                       from: from,
                                       to: to,
                                       body: body
                                     })
  end
end
