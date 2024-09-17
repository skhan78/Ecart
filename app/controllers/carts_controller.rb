class CartsController < ApplicationController
  def show
    @cart = @current_cart
  end
  def destroy
    @cart = @current_cart
    (@cart.line_items).nil? if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to cart_path,
        notice: 'Your cart is empty' }
     format.json { head :no_content }
     end
   end
end
