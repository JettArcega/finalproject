class ItemController < ApplicationController
  def index
    @item = Item.order(:name).paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @items = Item.find(params[:id])
  end
end
