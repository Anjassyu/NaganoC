class CartItemsController < ApplicationController
   before_action :authenticate_customer!

   def index
   	   @customer = Customer.find(current_customer.id)
         @total_price = calculate(current_customer)
   end

   def create
   	   @cart_item = CartItem.new(cart_item_params)
   	   @cart_item.customer_id = current_customer.id
   	   @cart_item.save
   	   redirect_to cart_items_path
   end

   def update
   	   @cart_item = CartItem.find(params[:id])
   	   @cart_item.update(cart_item_params)
   	   redirect_to cart_items_path
   end

   def destroy
   	   cart_item = CartItem.find(params[:id])
   	if cart_item.destroy
   	   flash[:notice] = "カート内の商品を削除しました。"
         redirect_to cart_items_path
      else
         render action: :index
      end
   end

   def destroy_all
   	if current_customer.cart_items.destroy_all
         flash[:notice] = "カート内の商品を全て削除しました。"
         redirect_to cart_items_path
      else
         redirect_to root_path
      end
   end

   private
   def cart_item_params
   	   params.require(:cart_item).permit(:count,:customer_id,:product_id)
   end

   def calculate(customer)
       total_price = 0
       customer.cart_items.each do |cart_item|
       total_price += (cart_item.product.price * 1.1).floor * cart_item.count
   end
       return (total_price ).floor
   end

end

