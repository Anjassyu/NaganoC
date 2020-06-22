class ProductsController < ApplicationController
def top
	@genres = Genre.all
	@products = Product.order(created_at: :desc).limit(4)
end

def index
	@genre = Genre.all
	@products = Product.all.page(params[:page]).per(8)
 #    @genres = Genre.where(effectiveness: true)
 # if params[:genre_id]
 #    @genre = Genre.find(params[:genre_id])
 #    @products = @genre.products.order(created_at: :desc).where(sales_status: "販売中")
 # else
 #    @products = Product.where(sales_status: "販売中")
 # end
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