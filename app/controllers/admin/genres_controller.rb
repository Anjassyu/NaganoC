class Admin::GenresController < ApplicationController

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def create
		@genre = Genre.new(genre_params)
  	@genre.save
  	path = Rails.application.routes.recognize_path(request.referer)
    redirect_to path
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	@genre.update(genre_params)
  	redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name,:effectiveness)
  end
end
