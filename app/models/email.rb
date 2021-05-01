# frozen_string_literal: true

class Email < ApplicationRecord
  belongs_to :invoice

  def delivered!
    update(
      status: "delivered",
      delivered_at: DateTime.now
    )
  end
end
