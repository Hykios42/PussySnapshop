class CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
  end
  
  def new
    @cart_item = CartItem.new
  end

  def show
  end
  
  def create
      @add_item_to_cart = CartItem.new(cart_id: Cart.find_by(user_id: current_user) ,item_id: params[:item_id])
      if @add_item_to_cart.save
        flash[:success] = "COOL !"
        puts('ok')
      else
        flash[:error]
        puts('fuckk')
      end
  end
end
