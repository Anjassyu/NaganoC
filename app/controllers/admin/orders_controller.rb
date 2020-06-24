class Admin::OrdersController < ApplicationController

	def index
	end

	def show
		@orders = Order.find(params[:id])
	end

	def update
		@orders = Order.find(params[:id])
		if @order.update(order_params)
		redirect_to admin_order_path, notice: '情報を更新しました。'
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
	 	    							  :order_status,
	 	    							  )
	end


end