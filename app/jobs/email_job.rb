# frozen_string_literal: true

class EmailJob < ApplicationJob
  queue_as :default

  def perform(email_id)
    email = Email.find(email_id)

    sleep(5)

    email.delivered!
  end
end
