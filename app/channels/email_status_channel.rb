# frozen_string_literal: true

class EmailStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "email_status"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
