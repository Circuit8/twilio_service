class MessagesController < ApplicationController
  def create
    Message.new(message_params).send
  end

  private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
