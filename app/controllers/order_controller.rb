class OrderController < ApplicationController
  def index
  end

  def new
  	@item = Item.find(params[:item_id])
  	@amount = @cart.total
  end

  def create
 	@item = Item.find(params[:item_id])
 	@cart = Cart.find(user_id: current_user.id)
  @amount = @cart.total

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
end
