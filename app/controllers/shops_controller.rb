class ShopsController < ApplicationController
  before_action :admin_user, only: [:edit, :create, :update, :destroy]
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    @shops = Shop.order(id: :desc).page(params[:page]).per(5)
  end

  def show
    @reviews = @shop.reviews.order(id: :desc).page(params[:page]).per(5)
  end

  def new
    @shop = Shop.new
  end

  def edit
  end
  
  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      flash[:success] = '店舗を登録しました。'
      redirect_to search_shop_admin_users_path
    else
      flash.now[:danger] = '店舗の登録に失敗しました。'
      render :new
    end
  end
  
  def update
    if @shop.update(shop_params)
      flash[:success] = '正常に更新されました'
      redirect_to search_shop_admin_users_url
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @shop.destroy
    flash[:success] = '店舗を削除しました。'
    redirect_to search_shop_admin_users_url
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
  
  private
  
  def set_shop
    @shop = Shop.find(params[:id])
  end
  
  def shop_params
    params.require(:shop).permit(:name, :address, :station_name, :open, :close)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
