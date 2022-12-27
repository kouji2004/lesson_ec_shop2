class Public::OrdersController < ApplicationController
  def index
  end

  def log
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:address_number] == "1"
      @order.address = current_customer.address
      @order.post_code = current_customer.post_code
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_number] == "2"
      @address = Address.find(params[:order][:registered])
      @order.address = @address.address
      @order.post_code = @address.post_code
      @order.address_name = @address.address_name
      @order.payment_method = params[:order][:payment_method]
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    end
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
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

    private

  def order_params
    params.require(:order).permit(:address_name, :postage, :billing_amount, :address, :payment_method,:post_code, :post_code)
  end

end
