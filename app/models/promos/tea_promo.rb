module Promos
  class TeaPromo < BasicPromoRule
    def initialize(order_id)
      @order_id = order_id
    end

    def apply
      multiplier = @line_item.quantity / 2
      Adjustment.create(
        order_id: @order.id,
        line_item_id: @line_item.id,
        amount: @line_item.price * multiplier,
        promo_class: self.class
      )
    end

    def eligible?
      return false unless Order.exists?(@order_id) && Product.find_by(sku: 'GR1')

      @order = Order.find(@order_id)
      @product_id = Product.find_by(sku: 'GR1').id
      @line_item = LineItem.find_by(order_id: @order_id, product_id: @product_id)

      return false if @line_item.nil? || @line_item.quantity < 2

      true
    end
  end
end
