class FavoritesController < ApplicationController

  def create
    train = Train.find(params[:train_id])
    favorite = current_user.favorites.new(train_id: train.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    train = Train.find(params[:train_id])
    favorite = current_user.favorites.find_by(train_id: train.id)
    favorite.destroy
    redirect_to request.referer
  end

end
