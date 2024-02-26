module Promos
  class StrawberriesPromo < BasicPromoRule
    def initialize(order_id)
      @order_id = order_id
    end

    def apply
      Adjustment.create(
        order_id: @order.id,
        line_item_id: @line_item.id,
        amount: 0.5 * @line_item.quantity,
        promo_class: self.class
      )
    end

    def eligible?
      return false unless Order.exists?(@order_id) && Product.find_by(sku: 'SR1')

      @order = Order.find(@order_id)
      @product_id = Product.find_by(sku: 'SR1').id
      @line_item = LineItem.find_by(order_id: @order_id, product_id: @product_id)

      return false if @line_item.nil? || @line_item.quantity < 3

      true
    end
  end
end
