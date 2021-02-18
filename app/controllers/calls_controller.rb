class CallsController < ApplicationController
  def create
    Call.new(call_params).ring
  end

  private

  def call_params
    params.require(:call).permit(:to, :from)
  end
end
