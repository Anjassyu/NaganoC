class CartItemsController < ApplicationController

	def show
		@cart_item = CartItem.new(cart_item_params)
	end


	def create
		@cart_item = current_customer.cart_items.build(cart_item_params)
		@cart_item.save
		   redirect_to root_path
		   flash[:notice] = "保存しました"
	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:customer_id, :product_id, :count)
	end
end

