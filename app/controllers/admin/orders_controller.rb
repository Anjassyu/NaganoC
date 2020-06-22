class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all.page(params[:page]).per(10)
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
	    							  :order_status)
	end
end
