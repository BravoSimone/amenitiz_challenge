class Promo < ApplicationRecord
  belongs_to :order

  def apply
    rule_class.constantize.new.apply(order_id)
  end
end
