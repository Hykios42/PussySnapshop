class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :own_profile, only: [:show]
  
  def show
  end

  private

  def own_profile
    if params[:id].to_i == current_user.id
    else
      redirect_to user_path(current_user.id)
      flash[:error] = "Tu n'as pas l'autorisation"
    end
  end
  
end
