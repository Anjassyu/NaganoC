class Admin::OrdersController < ApplicationController
 
 before_action :authenticate_admin!
	
	def index
		@orders = Order.all.page(params[:page]).per(10)
		if params[:customer_id]
	  	 @orders = Order.from_customer(params[:customer_id]).page(params[:page]).per(10)

		elsif params[:created_at]

		 @orders = Order.created_today(params[:creted_at]).page(params[:page]).per(10)
		end
	end

	def show
		@order = Order.find(params[:id])
		@ordered_products = @order.ordered_products
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to admin_orders_path, notice: '情報を更新しました。'
		if @order.order_status == "入金確認"
			@order.ordered_products.each do
				@order.ordered_products.update(
				production_status: 2)
			end
		end
		if 
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
	def ordered_product_params
	params.require(:ordered_product).permit(:production_status)

end
end

