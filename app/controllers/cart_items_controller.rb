class CartItemsController < ApplicationController
    
  def create
      @add_item_to_cart = CartItem.new(cart_id: Cart.find_by(user_id: current_user) ,item_id: params[:item_id])
      if @add_item_to_cart.save
        flash[:success] = "COOL !"
        puts('ok')*50
      else
        flash[:error]
        puts('fuckk')*50
      end
  end
end
