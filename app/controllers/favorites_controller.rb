class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(feed_id: params[:feed_id])
    redirect_to feeds_path, notice: "#{favorite.feed.user.name}さんの画像をお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to feeds_path, notice: "#{favorite.feed.user.name}さんの画像をお気に入り解除しました"
  end

  def index
    @favorites = Favorite.all
  end
end
