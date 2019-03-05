module ItemsHelper

  def all_items
    Item.all
  end

  def current_item
    Item.find(params[:id])
  end

end
