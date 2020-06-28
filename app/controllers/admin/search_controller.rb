class Admin::SearchController < ApplicationController
		 before_action :authenticate_admin!
	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@records = search_for(@model, @content)
	end

	private
	def search_for(model, content)
	 	if model == "customer"
	 		Customer.where('family_name_kanji LIKE ? OR family_name_kana LIKE ? OR first_name_kanji LIKE ? OR first_name_kana LIKE ?','%'+content+'%','%'+content+'%','%'+content+'%','%'+content+'%')
	 	elsif model == 'product'
	 		Product.where('name LIKE ?', '%'+content+'%')
	 	end
	end
end

