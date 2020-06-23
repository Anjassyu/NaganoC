class ProductsController < ApplicationController
def top
	@genres = Genre.all
	@products = Product.all 
end


def index
	@products = Product.all
	@genres = Genre.all
  if params[:genre_id]
     @genre = Genre.find(params[:genre_id])
  	 @products = Product.from_genre(params[:genre_id])
  else
  	 @products = Product.all
  end
end

def show
 	@product = Product.find(params[:id])
 	@cart_item = CartItem.new
end


private

def product_params
	params.require(:product).permit(:name, :description, :price, :sales_status)
end

end