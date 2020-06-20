class ProductsController < ApplicationController
def top
	@genres = Genre.all
	@products = Product.all
end


def index
	@genre = Genre.all
	@products = Product.all
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