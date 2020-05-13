class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :update, :destroy, :reviews, :likes]
  before_action :correct_user, only: [:show, :edit, :destroy]
  before_action :current_user_admin?, only: [:show, :reviews, :edit, :likes]
  before_action :set_user, only: [:show , :reviews, :edit, :update, :destroy, :likes]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = '正常に更新されました'
      redirect_to @user
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = '退会しました。'
    redirect_to root_url
  end
  
  def likes
    @favorite_shops = @user.favorite_shops.page(params[:page]).per(5)
  end
  
  def reviews
    @reviews = @user.reviews.order(id: :desc).page(params[:page]).per(5)
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to current_user
    end
  end
  
  def current_user_admin?
    if current_user.admin?
      redirect_to root_url
    end
  end
end
