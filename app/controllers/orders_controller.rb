class OrdersController < ApplicationController

	def new
		@order = Order.new
	end

	def confirm
		@order = Order.new(order_params)
		@cart_items = current_cart
	end

	def create
	end

	def thanks
	end

	def index
	end

	def show
	end
	
	private

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
