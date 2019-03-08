module CartItemsHelper

    def current_item
        Item.find(params[:id])
    end

    def allUserCartItem
      CartItem.all
    end


end
