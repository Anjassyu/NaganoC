class ProductsController < ApplicationController
def top
	@genres = Genre.all
	@products = Product.order(created_at: :desc).limit(4)
end


def index
	@genre = Genre.all
	@products = Product.all.page(params[:page]).per(8)
end

def show
	@product = Product.find(params[:id])
	@cart_item = CartItem.new
end

def genre_products
	@genre = Genre.find(params[:id])
	@products = Product.where(genre_id: @genre_id)
end	


private
	def product_params
		params.require(:product).permit(:name, :description, :price, :image)
	end

end