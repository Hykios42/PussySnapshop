class CartController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_action :own_profile, only: [:show]

    def show
        @cartItem = CartItem.all
        @item = Item.all
        @amount = total * 100
    end

  private

  def own_profile
    if params[:user_id].to_i == current_user.id
    else
      redirect_to user_path(current_user.id)
      flash[:error] = "Tu n'as pas l'autorisation"
    end
  end

  def total
    total = 0
      CartItem.all.each do |cartItem|
        if (cartItem.cart_id == current_cart.id)
          current_item = Item.all.find_by(id: cartItem.item_id)
        total += current_item.price
      end
    end
   return total
  end

  def current_cart
    @cart_current = Cart.find_by(user_id: current_user)
  end
end
