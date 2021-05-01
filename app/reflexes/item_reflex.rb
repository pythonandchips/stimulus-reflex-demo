# frozen_string_literal: true

class ItemReflex < ApplicationReflex
  def show
    invoice = Invoice.find(params[:id])
    item = invoice.items.build

    morph(
      "#new_item_modal",
      render(
        partial: "items/modal",
        locals: {
          invoice: invoice,
          item: item
        }
      )
    )
  end

  def create
    invoice = Invoice.find(params[:id])

    invoice.items.create!(item_params)

    morph(
      "#invoice_items",
      render(
        partial: "invoices/items",
        locals: {
          invoice: invoice
        }
      )
    )
    close
  end

  def close
    morph("#new_item_modal", "")
  end

  private

  def item_params
    params.require(:item).permit(:description, :quantity, :price)
  end
end
