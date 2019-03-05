class CartItemsController < ApplicationController
  def create
      add_item_to_cart = CartItem.new(cart_id: Cart.find_by(user_id: current_user).id , item_id: params[:item_id])
      

      if add_item_to_cart.save
        puts('ok');
        
      else
        puts('fuckk');
        
      end
  end
end
