class ItemController < ApplicationController
  def index
    @item = Item.order(:name).all
  end

  def show
    @items = Item.find(params[:id])
  end
end
