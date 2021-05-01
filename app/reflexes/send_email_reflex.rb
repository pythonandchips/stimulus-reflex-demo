# frozen_string_literal: true

class SendEmailReflex < ApplicationReflex
  def send
    invoice = Invoice.find(params[:id])

    if invoice.email_address.empty?
      cable_ready["email_status"].dispatch_event(
        name: "redirect",
        detail: {
          url: controller.edit_invoice_path(
            id: invoice.id,
            error: "No email address"
          )
        }
      ).broadcast

      moprh :nothing
      return
    end

    email = invoice.emails.create!(
      sent_to: invoice.email_address,
      status: "sending"
    )

    EmailJob.perform_later(email.id)
  end
end
