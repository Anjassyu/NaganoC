class Admin::OrderedProductsController < ApplicationController

	before_action :authenticate_admin!

	def update
		@ordered_product = OrderedProduct.find(params[:id])
		@ordered_product.update(ordered_product_params)
		redirect_to admin_order_path(@ordered_product.order_id), notice: '情報を更新しました。'

		@order = @ordered_product.order
		if @ordered_product.production_status == 3
			@order.update(order_status: "製作中")
		end

		@ordered_products = OrderedProduct.where(order_id: @order)
		if @ordered_products.where(production_status: 4).count == @ordered_products.all.count
			@order.update(order_status: "発送準備中")
		end
	end

	private

	def ordered_product_params
		params.require(:ordered_product).permit(:production_status)

	end
end
