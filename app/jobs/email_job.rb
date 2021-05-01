# frozen_string_literal: true

class EmailJob < ApplicationJob
  include CableReady::Broadcaster

  queue_as :default

  def perform(email_id)
    email = Email.find(email_id)

    sleep(5)

    email.delivered!

    update_dom(email.invoice)
  end

  def update_dom(invoice)
    cable_ready["email_status"].morph(
      children_only: true,
      selector: dom_id(invoice, "invoice_emails"),
      html: ApplicationController.render(
        partial: "invoices/email_history",
        locals: {
          invoice: invoice
        }
      )
    )
    cable_ready.broadcast
  end
end
