class Admin::OrdersController < ApplicationController

	def index
		@orders = Order.all.page(params[:page]).per(10)
		if params[:customer_id]
	  	 @orders = Order.from_customer(params[:customer_id]).page(params[:page]).per(10)

		elsif params[:created_at]

		 @orders = Order.created_today(params[:creted_at]).page(params[:page]).per(10)
		end
	end

	def show
		@ordered_products = OrderedProduct.all
		@order = Order.find(params[:id])
	end

	def update
		@ordered_products = OrderedProduct.all
		@order = Order.find(params[:id])
		if @order.update(order_params)
		redirect_to admin_orders_path, notice: '情報を更新しました。'
	    else
	    	render "show"
	    end
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

