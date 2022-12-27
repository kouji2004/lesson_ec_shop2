class Public::OrdersController < ApplicationController
  def index
  end

  def log
  end

  def new
    @items = Item.all
     @order = Order.new
     @cart_items = OrderDetail.all
  end

  def show
  end

  def thanks
  end
end
