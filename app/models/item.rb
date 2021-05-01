# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :invoice

  def net_value
    price * quantity
  end
end
