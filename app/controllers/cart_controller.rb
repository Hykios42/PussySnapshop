class CartController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_action :own_profile, only: [:show]

    def show
        @cartItem = CartItem.all
        @item = Item.all
    end

  private

  def own_profile
    if params[:user_id].to_i == current_user.id
    else
      redirect_to user_path(current_user.id)
      flash[:error] = "Tu n'as pas l'autorisation"
    end
  end

end