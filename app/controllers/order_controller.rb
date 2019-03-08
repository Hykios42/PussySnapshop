class OrderController < ApplicationController
  def index
  end

  def new
  	@item = Item.find(params[:item_id])
  	@amount = total * 100
  end

  def create
 	@item = Item.find(params[:item_id])
 	@cart = Cart.find(user_id: current_user.id)
  @amount = total * 100

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'eur',
  })

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end

  private

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

end
