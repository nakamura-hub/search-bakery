class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def new
    @shop = Shop.find(params[:id])
    @review = current_user.reviews.build
  end

  def create
   #binding.pry
    @shop = Shop.find_by(id: params[:id])
    @review = current_user.reviews.build(shop_id: @shop.id, message: review_params[:message])
    if @review.save
      flash[:success] = 'レビューを投稿しました。'
      redirect_to @shop
    else
      flash.now[:danger] = 'レビューの投稿に失敗しました。'
      render :new
    end
  end

  def destroy
    @review.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def review_params
    params.require(:review).permit(:message)
  end
  
  def correct_user
    @review = current_user.reviews.find_by(id: params[:id])
    unless @review
      redirect_to root_url
    end
  end
end
