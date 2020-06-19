class CustomersController < ApplicationController

	def show
        @customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		redirect_to customer_path(@customer.id)
	end

	def withdrow
	    @customer = Customer.find(params[:id]) #退会ページを表示する
	end

	def switch
		@customer = Customer.find(params[:id])
       if @customer.update(admission_status: false)
          sign_out current_customer #URLを踏ませずにコントローラーから直接サインアウトの指示を出す（device公式)
       end
       redirect_to root_path
	end

	private
	def customer_params
	    params.require(:customer).permit(:email,:admission_status, :family_name_kanji, :first_name_kanji, :family_name_kana, :first_name_kana, :tel, :postcode, :address,:password)
	end

end
