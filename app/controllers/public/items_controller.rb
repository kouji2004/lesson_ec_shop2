class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem.new
    @genres = Genre.all
  end


private

 def item_params
  params.require(:items).permit(:genre_id, :name, :introduction, :item_image, :price)
 end

end
