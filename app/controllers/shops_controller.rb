class ShopsController < ApplicationController
  def index
    @shops = Shop.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = @shop.reviews.order(id: :desc).page(params[:page]).per(5)
  end

  def search
    if params[:reset]
      @search_name = ""
      @search_keyword = ""
    else
      # 値保持用インスタンス変数
      @search_name = params[:name]
      @search_keyword = params[:keyword]
    end
    @shops = Shop.search(@search_name, @search_keyword).order(id: :desc).page(params[:page]).per(5)
  end
end
