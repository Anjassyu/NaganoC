class CartItem < ApplicationRecord 
	belongs_to :customer
	belongs_to :product

	def current_cart
  if session[:cart_item_id]
    @current_cart ||= self.find_by(id: session[:cart_item_id])
  end
end
end
