class Admin::CustomersController < ApplicationController


	def index
		@customers = Customer.all.page(params[:page]).per(10)
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		customer = Customer.find(params[:id])
		customer.update(customer_params)
		redirect_to admin_customer_path
	end

	private

	def customer_params
		params.require(:customer).permit(:email,
			                             :password,
			                             :family_name_kanji,
			                             :family_name_kana,
			                             :first_name_kanji,
			                             :first_name_kana,
			                             :postcode,
			                             :address,
			                             :tel,
			                             :admission_status)

	end

end