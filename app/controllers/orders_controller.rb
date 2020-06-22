class OrdersController < ApplicationController

	def new
		@order = Order.new
		@derivery_address = Delivery.where(customer: current_customer)
	end

	def confirm
		@cart_items = current_customer.cart_items
		@order = Order.new(
				customer: current_customer,
				payment: params[:order][:payment],
				postage: 800
			)

		if params[:order][:addresses] == "your_address"
			@order.postcode = current_customer.postcode
			@order.address = current_customer.address
			@order.name = current_customer.full_name
		elsif
			params[:order][:addresses] == "registered_address"
			delivery = Delivery.find(params[:order][:delivery_id])
			@order.postcode = delivery.postcode
      @order.address = delivery.address
      @order.name = delivery.name
    else
    	params[:order][:addresses] == "new_address"
    	@order.postcode = params[:order][:postcode]
    	@order.address = params[:order][:address]
    	@order.name = params[:order][:name]
    end
	end

	def create
		@order = current_customer.orders.new(order_params)
		@order.save
		redirect_to orders_thanks_path, notice: "ご注文が確定しました。"

		@cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    OrderedProduct.create!(
      product: cart_item.product,
      order: @order,
      count: cart_item.count,
      price: cart_sub_price(cart_item)
    )
    end
    @cart_items.destroy_all

    
	end

	def thanks
		@orders = Order.all
		@ordered_products = OrderedProduct.all
		@deliveries = Delivery.where(customer: current_customer)

	end

	def index
	end

	def show
	end
	
	private

	def cart_sub_price(cart_item)
		cart_item.product.price * 1.1 * cart_item.count
	end

	def order_params
	    params.require(:order).permit(:customer_id, 
	    															:name, 
	    															:postcode, 
	    															:address, 
	    															:postage, 
	    															:billing_amount, 
	    															:payment,
	    															:order_status
	    															)
	end
end