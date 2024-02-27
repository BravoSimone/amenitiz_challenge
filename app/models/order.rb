class Order < ApplicationRecord
  has_many :promos
  has_many :line_items
  has_many :adjustments

  AVAILABLE_PROMOS = ["CoffeePromo", "StrawberriesPromo", "TeaPromo"]

  def add_product(product, quantity = 1)
    if line_item = LineItem.find_by(product_id: product.id, order: self.id)
      line_item.quantity += quantity
      line_item.save
    else
      LineItem.create(
        order_id: self.id,
        product_id: product.id,
        price: product.price,
        quantity: quantity
      )
    end

    apply_adjustments
    update_total
  end

  def apply_adjustments
    self.adjustments.destroy_all

    AVAILABLE_PROMOS.each do |promo_class|
      promo_instance = "Promos::#{promo_class}".constantize.new(self.id)
      promo_instance.apply if promo_instance.eligible?
    end
  end

  def update_total
    self.total = line_items_total - adjustments.where(line_item_id: nil).pluck(:amount).sum
    save
  end

  private

  def line_items_total
    line_items.pluck(:final_price).sum
  end
end
