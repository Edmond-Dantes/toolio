class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:show, :destroy]

  def index
    # @items = Item.paginate(:page => params[:page], :per_page => 12)
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to item_path(@item)
    else
      raise
      redirect_to items_path
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:id, :name, :description, :token_value, :photo, :user_id)
  end
end
