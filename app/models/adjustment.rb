class Adjustment < ApplicationRecord
  belongs_to :order
  belongs_to :line_item, optional: true

  after_save :trigger_line_item_price_update

  def trigger_line_item_price_update
    return if line_item.nil?

    line_item.save
  end
end
