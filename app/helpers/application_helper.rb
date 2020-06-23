module ApplicationHelper
	#カレントユーザーのカートアイテム
  def current_cart
    current_customer.cart_items
  end
  #税込価格	
	def tax_included(price)
		(price * 1.1).floor
	end
	#小計
	def subprice(sub)
		tax_included(sub.product.price) * sub.count
	end
	# カートアイテムの合計金額
  def total_price(cart_items)
    price = 0
    cart_items.each do |cart|
      price  +=  subprice(cart)
    end
    return price
  end
  #送料込みか請求金額
  def billing(order)
    total_price(current_cart) + order.postage
  end

end
