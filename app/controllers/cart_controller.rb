class CartController < ApplicationController
    def show
        @cartItem = CartItem.all
        @item = Item.all
    end
end
