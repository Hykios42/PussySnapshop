class CartItemsController < ApplicationController
  def new
    @cart_item = CartItem.new
  end

  def create
    puts "---------------------------"
    puts Cart.find_by(user_id: current_user).id
    puts params[:item_id]
    puts "---------------------------"
      @add_item_to_cart = CartItem.new(cart_id: Cart.find_by(user_id: current_user).id ,item_id: params[:item_id])
      if @add_item_to_cart.save
        puts('ok');
      else
        puts('fuckk');
        
      end
  end
end
