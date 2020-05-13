class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    shop = Shop.find_by(id: params[:shop_id])
    current_user.favorite(shop)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to root_url
  end

  def destroy
    shop = Shop.find_by(id: params[:shop_id])
    current_user.unfavorite(shop)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_url
  end
end