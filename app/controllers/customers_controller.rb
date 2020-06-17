class CustomersController < ApplicationController
#before_action :authenticate_user!
#before_action :baria_user, only: [:edit, :update]

def show
	#@customer = Customer.find(params[:id])	
end	

def edit
	#@customer = Customer.find(params[:id])
end

def update

end

def withdrow	

end

def switch
	
end

private

def customre_params
	params.require(:customer).permit(:name, :edit)
end

end