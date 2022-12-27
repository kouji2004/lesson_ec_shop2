class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.item_count += params[:cart_item][:item_count].to_i
      cart_item.update(item_count: cart_item.item_count)
      redirect_to cart_items_path
    else @cart_item.save
      redirect_to cart_items_path
    end
  end

  def destroy
      cart_item = CartItem.find(params[:id])
      cart_item.destroy
      @cart_items = CartItem.all
       redirect_to cart_items_path
  end

  def all_destroy
      @cart_items = CartItem.all
      @cart_items.destroy_all
      redirect_to cart_items_path
  end

 def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :item_count)
 end

end
