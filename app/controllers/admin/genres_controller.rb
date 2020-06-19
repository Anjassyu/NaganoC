class Admin::GenresController < ApplicationController

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
    @genres = Genre.all
		@genre = Genre.new(genre_params)
  	if @genre.save
  	   path = Rails.application.routes.recognize_path(request.referer)
       redirect_to path, notice: '商品ジャンルを追加しました。'
    else
      render "index"
    end
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  	   redirect_to admin_genres_path, notice: '商品ジャンルを更新しました。'
    else
      render "edit"
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name,:effectiveness)
  end
end