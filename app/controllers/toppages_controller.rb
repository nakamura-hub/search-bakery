class ToppagesController < ApplicationController
  def index
    @shops = Shop.limit(9).order(id: :desc)
  end
end
