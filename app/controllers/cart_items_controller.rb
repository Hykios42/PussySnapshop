class CartItemsController < ApplicationController
    
  def create
      @add_item_to_cart = CartItem.new(cart_id: Cart.find_by(user_id: current_user).id, item_id: params[:item_id])
      if @add_item_to_cart.save
        flash[:success] = "COOL !"
        redirect_to item_path(params[:item_id])
      else
        flash[:error] = "PAS COOL!"
        redirect_to item_path(params[:item_id])
      end
  end
  
end