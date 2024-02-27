class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @line_items = LineItem.includes(:product).where(order_id: params[:id])
    @products = Product.all
  end

  def create
    @order = Order.create
    redirect_to order_url(@order)
  end

  def add_product
    @order = Order.find(params[:id])
    @order.add_product(Product.find(params[:product_id]))
    redirect_to order_url(@order)
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to orders_url
  end
end
