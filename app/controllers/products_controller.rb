class ProductsController < ApplicationController
def top
	@genres = Genre.all
	@products = Product.order(created_at: :desc).limit(4)
end


def index
	 @genres = Genre.all
  if params[:genre_id]
     @genre = Genre.find(params[:genre_id])
  	 @products = Product.from_genre(params[:genre_id]).order(updated_at: :desc)
  else
  	 @products = Product.order(updated_at: :desc)
  end
end

def show
	@genres = Genre.all
	@product = Product.find(params[:id])
	@cart_item = CartItem.new
end


private

def product_params
	params.require(:product).permit(:name, :description, :price, :image, :sales_status)
end

end