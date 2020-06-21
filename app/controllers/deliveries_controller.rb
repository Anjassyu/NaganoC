class DeliveriesController < ApplicationController
before_action :authenticate_customer!
def index
	@delivery = Delivery.new
	@deliveries = Delivery.all
end


def create
	@delivery = Delivery.new(delivery_params)
	@delivery.customer_id = current_customer.id 
	if @delivery.save!
	   redirect_to deliveries_path
	   flash[:notice] = "保存しました"
	else
	   @deliveries = Delivery.all
	   render 'index'
	end
end

def edit
	@delivery = Delivery.find(params[:id])
end

def update
	@delivery = Delivery.find(params[:id])
	if @delivery.update(delivery_params)
		flash[:notice] = "保存しました"
		redirect_to deliveries_path
	else
		render 'edit'
	end
end

def destroy
	@delivery = Delivery.find(params[:id])
	@delivery.destroy
	flash[:notice] = "削除しました"
	redirect_to deliveries_path
end


private
def delivery_params
	params.permit(:postcode, :address, :name, :customer_id)
end

end
