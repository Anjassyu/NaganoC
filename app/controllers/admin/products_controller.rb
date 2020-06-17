class Admin::ProductsController < ApplicationController
	
	def top
		@today_orders = Product.where(created_at: Date.today)
	end

	def index
		@products = Product.all
	end
		
	def new
		@product = Product.new
		@genres = Genre.all
	end

	def create
	end
	
	def show
	end
	
	def edit
	end
	
	def update
	end

  private

  def product_params
  	params.require(:product).permit(:name, :description, :price, :sales_status, :image)
  end
end
