class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end
  def create
    if @order = Order.new(order_params)
      @order.save
       @current_cart.line_items.each do |line_item|
         @order.order_items.create(         
             product_id: line_item.product_id,
             quantity:   line_item.quantity,
             cart_id:   line_item.cart_id
          )
          end
        if @order.save
        redirect_to orders_path, notice: 'Order was successfully created.'
    else
        redirect_to root_path, notice: 'Something went wrong saving the order.'
    end 
  end
 end

  private
    def order_params
      params.require(:order).permit(:name, :email, :address, :pay_method)
    end
end
