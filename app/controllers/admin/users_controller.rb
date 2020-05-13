class Admin::UsersController < ApplicationController
  before_action :admin_user

  def search_shop
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).page(params[:page]).per(5)
  end

  private
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
