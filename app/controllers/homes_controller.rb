class HomesController < ApplicationController

	def top
		@genres = Genre.all
	    @products = Product.all
	end

	def about
	end

	def genre_products
		@genre = Genre.find(params[:id])
		@products = Product.where(genre_id: @genre_id)
	end	
end
