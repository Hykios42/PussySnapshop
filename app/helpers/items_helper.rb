module ItemsHelper

  def current_item
    Item.find(params[:id])
  end

end
