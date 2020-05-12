class ShopsController < ApplicationController
  def index
    @shops = Shop.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews.order(id: :desc).page(params[:page]).per(5)
  end

  def search
    @shops = Shop.search(params[:name], params[:keyword]).order(id: :desc).page(params[:page]).per(5)
  end
end
