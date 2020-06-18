class CustomersController < ApplicationController
<<<<<<< HEAD
=======

	def show
	end

	def edit
	end

	def update
	end

	def withdrow
	    @customer = Customer.find(params[:id])
	end

	def switch
		@customer = Customer.find(params[:id])
	end
end
>>>>>>> origin/Develop
