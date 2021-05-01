# frozen_string_literal: true

class Invoice < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :emails, dependent: :destroy

  validates(
    :reference,
    :dated_on,
    :name,
    :city,
    :county,
    :postcode,
    presence: true
  )

  def total_value
    items.sum(&:net_value)
  end
end
