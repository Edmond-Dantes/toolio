class ItemsController < ApplicationController
  def index
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
    @exchange = Exchange.new
  end

  def destroy
  end
end
