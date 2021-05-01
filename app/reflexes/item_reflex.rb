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

  def close
    morph("#new_item_modal", "")
  end
end
