# frozen_string_literal: true

class SendEmailReflex < ApplicationReflex
  def send
    invoice = Invoice.find(params[:id])

    email = invoice.emails.create!(
      sent_to: invoice.email_address,
      status: "sending"
    )

    EmailJob.perform_later(email.id)
  end
end
