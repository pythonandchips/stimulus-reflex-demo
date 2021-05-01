# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :load_contacts

  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
    @contact = Contact.find_by(id: contact_id)
    if @contact
      new_invoice_params.merge!(
        @contact.attributes.slice(
          "name", "email_address", "city", "county", "postcode"
        )
      )
    end
    @invoice = Invoice.new(new_invoice_params)

    render layout: false if @stimulus_reflex
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
    @contact = Contact.find_by(id: contact_id)
    if @contact
      new_invoice_params.merge!(
        @contact.attributes.slice(
          "name", "email_address", "city", "county", "postcode"
        )
      )
    end
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoice_params)
      redirect_to invoice_path(@invoice)
    else
      render :edit
    end
  end

  private

  def new_invoice_params
    @new_invoice_params ||= params.permit(:invoice).permit(
      :reference, :dated_on, :name, :email_address, :city, :county, :postcode
    )
  end

  def invoice_params
    @invoice_params ||= params.require(:invoice).permit(
      :reference, :dated_on, :name, :email_address, :city, :county, :postcode
    )
  end

  def contact_id
    params.dig(:invoice, :contact_id) || params[:contact_id]
  end

  def load_contacts
    @contacts = Contact.all.order(:name)
  end
end
