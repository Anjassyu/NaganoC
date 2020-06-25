class Admin::ProductsController < ApplicationController
	 before_action :authenticate_admin!
	def top
		@today_orders = Product.where(created_at: Date.today)
	end

	def index
		@products = Product.page(params[:page])
	end
		
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
	 if @product.save
    	redirect_to admin_product_path(@product.id), notice: '商品を新規登録しました。'
     else
     	@products = Product.page(params[:page])
    	render "new"
     end
	end
	
	def show
		@product = Product.find(params[:id])
	end
	
	def edit
		@product = Product.find(params[:id])
	end
	
	def update
		@product = Product.find(params[:id])
	 if @product.update(product_params)
		redirect_to admin_product_path(@product.id), notice: '商品情報を更新しました。'
	 else
		render "edit"
	 end
	end

  private

  def product_params
  	params.require(:product).permit(:genre_id, :name, :description, :price, :sales_status, :image)
  end

end
