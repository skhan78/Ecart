class LineItemsController < ApplicationController
  def new 
    @line_item = LineItem.new
  end 
  def create
    chosen_product = Product.find(params[:product_id])

    current_cart = @current_cart
    if current_cart.products.include?(chosen_product)
      @line_item = current_cart.line_items.find_by(:product_id => chosen_product)
      if @line_item.quantity==nil
        @line_item.quantity=1
      else
        @line_item.quantity+=1
      end
    else
   
      @line_item = LineItem.new
      @line_item.cart = current_cart
      @line_item.product = chosen_product
    end
  
    if @line_item.save
    redirect_to cart_path(current_cart)
    end
  end
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  def add_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity >=1
    @line_item.quantity += 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end
  
  def reduce_quantity
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity > 1
      @line_item.quantity -= 1
    end
    @line_item.save
    redirect_to cart_path(@current_cart)
  end
  private
    def line_item_params
      params.require(:line_item).permit(:quantity,:product_id, :cart_id)
    end
end
