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
		@product = Product.new(product_params)
		@product.save!
  	path = Rails.application.routes.recognize_path(request.referer)
    redirect_to path
	end
	
	def show
		@product = Product.find(params[:id])
		@genre = Genre.find_by(id: @product.genre_id)
	end
	
	def edit
	end
	
	def update
	end

  private

  def product_params
  	params.require(:product).permit(:genre_id, :name, :description, :price, :sales_status, :image)
  end


end
